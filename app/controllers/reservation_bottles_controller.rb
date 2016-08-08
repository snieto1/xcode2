class ReservationBottlesController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @club = @reservation.table.club
    @table = current_user.reservation.table
    @reservation = current_user.reservation
  end

  def create
    @club = @reservation.table.club
    @table = current_user.reservation.table
    @reservation = current_user.reservation
    bottle = Bottle.find(params[:bottle_id])
    ReservationBottle.create!(bottle: bottle, reservation: @reservation)
    redirect_to :back
  end

  def delete
    @table = current_user.reservation.table
    @reservation = current_user.reservation
    bottle = Bottle.find(params[:bottle_id])
    ReservationBottle.find_by(bottle: bottle, reservation: @reservation).destroy
    redirect_to :back
  end

end
