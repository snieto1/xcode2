class ReservationsController < ApplicationController
  def new
    @table = Table.find(params[:table_id])
    @reservation = Reservation.new
  end

  def create
    @table = Table.find(params[:table_id])
    @reservation = Reservation.create!(table: @table, user: current_user)
    redirect_to new_reservation_reservation_bottle_path(@reservation)
  end

  def destroy
  end
end