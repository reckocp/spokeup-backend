class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :description
      t.belongs_to :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
