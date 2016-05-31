class RoomsController < ApplicationController

  before_action :authenticate_user!

  def show
    @candidate = get_candidate(params[:id])
    p @candidate.who_can_enter
    unless @candidate.who_can_enter.include?(current_user.id)
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end

  private

  def get_candidate(id)
    candidate = User.includes(:room_messages)
                    .where(id: id)
                    .where(role: User::CANDIDATE_ROLE)
                    .where(open: true)
                    .first
    unless candidate.present?
      flash[:alert] = "This room is not open"
      redirect_to root_path
    end
    candidate
  end
end
