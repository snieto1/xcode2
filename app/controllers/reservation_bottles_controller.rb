class ReservationBottlesController < ApplicationController
  def new
    @table = current_user.reservation.table
    @reservation = current_user.reservation
  end

  def create
    @table = current_user.reservation.table
    @reservation = current_user.reservation
    bottle = Bottle.find(params[:bottle_id])
    ReservationBottle.create!(bottle: bottle, reservation: @reservation)
    redirect_to :back
  end
end
