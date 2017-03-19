class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.text :name
      t.text :url
      t.integer :article_id
      t.date :date
      t.text :xpath
      t.text :word1
      t.text :word2
      t.text :word3
      t.text :upper
      t.text :lower

      t.timestamps null: false
    end
  end
end
