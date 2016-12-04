class ChangeGithubIdTypeInRepositories < ActiveRecord::Migration[5.0]
  def self.up
    change_column :repositories, :github_id, 'integer USING CAST(github_id AS integer)'
  end

  def self.down
    change_column :repositories, :github_id, :string
  end
end
