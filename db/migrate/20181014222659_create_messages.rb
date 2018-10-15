class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :to, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :delivered, default: false
      t.integer :messenger, null: false
      t.datetime :start

      t.timestamps
    end
  end
end
