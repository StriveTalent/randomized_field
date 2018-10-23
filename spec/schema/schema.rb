ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :random_field1
    t.string :random_field2
    t.string :random_field3

    t.timestamps
  end
end
