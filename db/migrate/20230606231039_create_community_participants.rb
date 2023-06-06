class CreateCommunityParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :community_participants do |t|
      t.references :community, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
