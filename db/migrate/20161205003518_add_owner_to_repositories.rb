class AddOwnerToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :owner, :string, null: false
  end
end
