$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'lazy_attributes'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory:'
  load 'schema.rb'
end
