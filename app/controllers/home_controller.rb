class HomeController < ApplicationController
  def index
    @scores = Score.joins(:user).
    select('users.*, sum(score_points) as total').
    group('users.id').
    order('total DESC')
  end

  def history
    @games = current_user.games
  end

  def log
    @users = User.all_except(current_user)
    @game = Game.new
  end
end
