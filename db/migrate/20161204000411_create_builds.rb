class CreateBuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :builds do |t|
      t.belongs_to :repository, index: true, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end
  end
end
