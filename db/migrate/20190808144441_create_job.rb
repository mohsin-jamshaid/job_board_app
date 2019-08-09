class CreateJob < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title, default: '', null: false
      t.integer :category
      t.string :company, default: '', null: false
      t.text :description, default: '', null: false
      t.string :link, default: '', null: false
      t.timestamps
    end
  end
end
