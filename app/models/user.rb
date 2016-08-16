class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :scores
  has_many :games, through: :scores
  
  scope :all_except, ->(user) { where.not(id: user) }

  def score_points_total
    total = 0
    self.scores.each { |score|  total += score.points }
    total
  end

end
