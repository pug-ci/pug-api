class AddConnectedToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :connected, :boolean, null: false, default: false
  end
end
