class RoomsController < ApplicationController

  before_action :authenticate_user!

  def show
    @candidate = get_candidate(params[:id])
    @hrs = User.hrs(current_user.id)
    unless @candidate.who_can_enter.include?(current_user.id)
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end

  private

  def get_candidate(id)
    candidate = User.candidate(id)
    unless candidate.present?
      flash[:alert] = "This room is not open"
      redirect_to root_path
    end
    candidate
  end
end
