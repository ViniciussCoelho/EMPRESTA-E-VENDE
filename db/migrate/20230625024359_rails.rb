class Rails < ActiveRecord::Migration[7.0]
  def change
    create_join_table :communities, :users, table_name: :community_modders
  end
end
