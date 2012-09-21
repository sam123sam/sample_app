class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :University
      t.string :Highschool

      t.timestamps
    end
  end
end
