class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name
      t.string :color
      t.boolean :default

      t.timestamps
    end
  end
end
