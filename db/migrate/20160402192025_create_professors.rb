class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :department
      t.string :email
      t.boolean :request_copy, default: false
      t.boolean :notification, default: false
      t.timestamps null: false
    end

    create_table :assignments, id: false do |t|
      t.belongs_to :professor, index: true
      t.belongs_to :course, index: true
    end
  end
end
