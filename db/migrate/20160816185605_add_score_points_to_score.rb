class AddScorePointsToScore < ActiveRecord::Migration
  def change
    add_column :scores, :score_points, :integer
  end
end
