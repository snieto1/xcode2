class ReservationsController < ApplicationController
  protect_from_forgery with: :null_session
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
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to clubs_path
  end

  def show
    @user = current_user
    @reservation = Reservation.find_by(user_id: @user.id)
  end
end
