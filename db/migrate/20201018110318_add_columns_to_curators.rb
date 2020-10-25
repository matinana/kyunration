class AddColumnsToCurators < ActiveRecord::Migration[6.0]
  def change
    add_column :curators, :provider, :string
    add_column :curators, :uid, :string
    add_column :curators, :username, :string
  end
end
