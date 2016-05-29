class RoomsController < ApplicationController
  def show
    @candidate = User.includes(:messages).where(id: params[:id]).first
  end
end
