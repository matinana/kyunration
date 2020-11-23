class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :curator, index: true, null: false, foreign_key: true
      t.integer :type, null: false, default: 0
      t.text :url
      t.string :title, null: false, default: ''
      t.text :comment
      t.integer :emotion, null: false, default: 0
      t.integer :star, null: false, default: 0
      t.datetime :viewed_at

      t.timestamps
    end
  end
end
