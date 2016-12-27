class AddGithubWebhookIdToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :github_webhook_id, :integer
  end
end
