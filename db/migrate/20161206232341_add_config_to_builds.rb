class AddConfigToBuilds < ActiveRecord::Migration[5.0]
  def change
    add_column :builds, :config, :jsonb, null: false, default: {}
  end
end
