require 'active_record'

module DerGuteMoritz
  module ActiveRecord
    module LazyAttributes

      def self.included(base)
        base.class_eval do
          class_inheritable_accessor :lazy_attributes
          class_inheritable_accessor :eager_attributes
          self.lazy_attributes = []
          extend ClassMethods
          metaclass.alias_method_chain :default_select, :lazy_attributes
        end
      end

      module ClassMethods

        def attr_lazy(*attrs)
          normalized_attrs = attrs.map { |a| a.to_s }
          self.lazy_attributes += normalized_attrs
          self.eager_attributes = (column_names - lazy_attributes).map { |a| connection.quote_column_name(a) }

          normalized_attrs.each do |attr|
            define_method attr do
              @attributes[attr] ||= connection.select_value('SELECT %s FROM %s WHERE %s = %s' % [connection.quote_column_name(attr), self.class.quoted_table_name, self.class.primary_key, quoted_id])
              read_attribute(attr)
            end
          end

        end

        private
        
        def default_select_with_lazy_attributes(qualified)
          if lazy_attributes.empty?
            default_select_without_lazy_attributes(qualified)
          else
            if qualified
              eager_attributes.map { |a| "#{quoted_table_name}.#{a}"  }
            else
              eager_attributes
            end.join(', ')
          end
        end
        
      end
      
    end
  end
end


ActiveRecord::Base.send :include, DerGuteMoritz::ActiveRecord::LazyAttributes
