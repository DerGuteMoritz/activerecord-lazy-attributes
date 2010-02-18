class Image < ActiveRecord::Base
  attr_lazy :data
end
