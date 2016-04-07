class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :department
      t.timestamps null: false
    end

    create_table :assignments, id: false do |t|
      t.belongs_to :professor, index: true
      t.belongs_to :course, index: true
    end
  end
end
