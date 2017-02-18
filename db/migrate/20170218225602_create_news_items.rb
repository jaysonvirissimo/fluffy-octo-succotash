class CreateNewsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :news_items do |t|
      t.references :news_week, foreign_key: true
      t.string :category
      t.text :body

      t.timestamps
    end
  end
end
