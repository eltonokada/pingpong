class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :played_date
    end
  end
end
