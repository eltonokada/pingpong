class GamesController < ApplicationController
  def create
   @game = Game.create(game_params)
   @opponent = User.where("id = ?", params[:opponent]).first

   @game.scores.build(user_id: current_user.id, points: params[:current_user_score], score_points: calculate_current_user_score_points )
   @game.scores.build(user_id: @opponent.id, points: params[:opponent_score], score_points: calculate_oponent_score_points )
   
   @game.save!

   redirect_to :history
  end

  private

  def game_params
    params.require(:game).permit(:played_date)
  end

  def calculate_current_user_score_points
    return 100 if current_user.score_points_total > @opponent.score_points_total
    return 50
  end

  def calculate_oponent_score_points
    return 100 if @opponent.score_points_total > current_user.score_points_total
    return 50
  end

end