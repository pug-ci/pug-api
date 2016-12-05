class AddDetailsToBuilds < ActiveRecord::Migration[5.0]
  def change
    add_column :builds, :ref, :string, null: false
    add_column :builds, :commit_id, :string, null: false
    add_column :builds, :commit_url, :string, null: false
    add_column :builds, :commit_message, :string, null: false
    add_column :builds, :committer_username, :string, null: false
  end
end
