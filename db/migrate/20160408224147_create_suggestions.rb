class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :name
      t.text :body
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
