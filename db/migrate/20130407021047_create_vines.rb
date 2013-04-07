class CreateVines < ActiveRecord::Migration
  def change
    create_table :vines do |t|
      t.string :uri
      t.string :vineid

      t.timestamps
    end
  end
end
