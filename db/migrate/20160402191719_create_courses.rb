class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :ccn
      t.string :title
      t.string :location
      t.string :days
      t.string :time
      t.timestamps null: false
    end
  end
end
