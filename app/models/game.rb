class Game < ActiveRecord::Base
  has_many :scores
  has_many :users, through: :scores

  def opponent(user)
    self.users.where.not(id: user).first.email
  end

  def current_user_score(user)
    self.scores.where(user_id: user.id).first.points
  end

  def opponent_score(user)
    self.scores.where.not(user_id: user.id).first.points
  end

  def result(user)
    return "W" if current_user_score(user) > opponent_score(user)
    return "L" 
  end
end
