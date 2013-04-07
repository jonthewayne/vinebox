class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :query
      t.string :title
      t.string :background
      t.string :bigad
      t.string :smallad
      t.text :description

      t.timestamps
    end
  end
end
