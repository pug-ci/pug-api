class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :github_id, null: false
      t.string :token, null: false
      t.string :name, null: false
      t.string :url, null: false

      t.timestamps
    end

    add_index :repositories, :github_id, unique: true
    add_index :repositories, :token, unique: true
  end
end
