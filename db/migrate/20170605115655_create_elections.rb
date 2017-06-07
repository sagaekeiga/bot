class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections do |t|
      t.text :name
      t.text :description
      t.integer :article_id
      t.text :status
      t.text :worker

      t.timestamps
    end
  end
end
