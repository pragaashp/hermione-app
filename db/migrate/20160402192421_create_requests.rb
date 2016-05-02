class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :comments
      t.integer :status, default: 0
      t.string :format
      t.belongs_to :course, index: true
      t.timestamps null: false
    end
  end
end
