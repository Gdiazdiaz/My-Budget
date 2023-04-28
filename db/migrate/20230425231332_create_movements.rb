class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.references :category, foreign_key: {to_table: :groups}
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
