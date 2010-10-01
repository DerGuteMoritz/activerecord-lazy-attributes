root = Pathname.new(__FILE__).dirname

require root.join('spec_helper')
require root.join('models/image')

describe DerGuteMoritz::ActiveRecord::LazyAttributes do

  before :each do
    @id = Image.create!(:name => 'an image', :data => 'a lot of data').id
  end

  it 'should eagerly load attributes not defined lazy' do
    i = Image.find(@id)
    i.should have_attribute('name')
    i.name.should == 'an image'
  end

  it 'should lazily load attributes defined as lazy' do 
    i = Image.find(@id)
    i.should_not have_attribute('data')
    i.data
    i.data.should == 'a lot of data'
    i.should have_attribute('data')
  end
  
  it 'should provide a predicate that checks agains the database if the lazy attribute has not been loaded yet' do 
    i = Image.find(@id)
    i.data?.should be_true
    i.should_not have_attribute('data')
  end
  
end
