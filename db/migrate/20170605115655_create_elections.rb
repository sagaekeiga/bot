class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections do |t|
      t.text :name
      t.text :description
      t.text :article_id
      t.text :status

      t.timestamps
    end
  end
end
