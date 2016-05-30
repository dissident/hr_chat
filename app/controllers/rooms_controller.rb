class RoomsController < ApplicationController

  before_action :authenticate_user!

  def show
    @candidate = User.includes(:room_messages).where(id: params[:id]).first
  end
end
