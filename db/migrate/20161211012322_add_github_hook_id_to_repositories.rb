class AddGithubHookIdToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :github_hook_id, :integer, null: false
  end
end
