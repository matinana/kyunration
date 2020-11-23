class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :curator, index: true, null: false, foreign_key: true
      t.string :name, null: false, default: ''

      t.timestamps

      t.index [:curator_id, :name], unique: true
    end
  end
end
