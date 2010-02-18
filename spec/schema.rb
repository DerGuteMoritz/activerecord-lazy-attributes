ActiveRecord::Schema.define do

  create_table :images do |t|
    t.text :name
    t.text :data
  end
  
end
