require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "activerecord-lazy-attributes"
    gem.summary = %Q{An ActiveRecord extension which allows attributes to be lazy-loaded}
    gem.description = %Q{A useful ActiveRecord extension to handle columns containing large amounts of data}
    gem.email = "moritz@twoticketsplease.de"
    gem.homepage = "http://github.com/DerGuteMoritz/activerecord-lazy-attributes"
    gem.authors = ["Moritz Heidkamp"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency 'activerecord', '>= 2.3.5'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "activerecord-lazy-attributes #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
