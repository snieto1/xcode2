class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :current_user

  def checkout
    @table = @current_user.reservation.table
    @total = 0
    @table.reservation.bottles.each.sum do |bottle|
      total = bottle.price
      @total += total
    end
    @total = @total * 100
  end

  def confirmation
    @user = User.find(params[:user_id])
    @table = @user.reservation.table
    @club = Club.find(@table[:club_id])
    @total = 0
    @table.reservation.bottles.each.sum do |bottle|
      total = bottle.price
      @total += total
    end

  end

end
