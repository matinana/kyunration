class CreateContentTags < ActiveRecord::Migration[6.0]
  def change
    create_table :content_tags do |t|
      t.references :content, index: true, null: false, foreign_key: true
      t.references :tag, index: true, null: false, foreign_key: true

      t.timestamps

      t.index [:content_id, :tag_id], unique: true
    end
  end
end
