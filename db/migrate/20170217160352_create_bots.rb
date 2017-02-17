class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.text :name
      t.text :url
      t.integer :article_id
      t.date :date

      t.timestamps null: false
    end
    add_index :bots, [:name, :url, :article_id, :date]
  end
end
