class CreateRepositoriesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories_users do |t|
      t.belongs_to :repository, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end

    add_index :repositories_users, [:repository_id, :user_id], unique: true
  end
end
