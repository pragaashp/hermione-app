class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :comments
      t.integer :status
      t.belongs_to :course, index: true
      t.timestamps null: false
    end
  end
end
