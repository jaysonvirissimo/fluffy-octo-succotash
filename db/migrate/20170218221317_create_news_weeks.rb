class CreateNewsWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :news_weeks do |t|
      t.date :date

      t.timestamps
    end
  end
end
