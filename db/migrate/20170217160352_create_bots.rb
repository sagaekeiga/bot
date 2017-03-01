class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.text :name
      t.text :url
      t.integer :article_id
      t.date :date
      t.text :xpath

      t.timestamps null: false
    end
  end
end
