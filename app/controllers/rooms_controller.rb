class RoomsController < ApplicationController

  before_action :authenticate_user!

  def show
    @candidate = get_candidate(params[:id])
  end

  private

  def get_candidate(id)
    candidate = User.includes(:room_messages)
                    .where("id = ? and role = ?", id, User::CANDIDATE_ROLE)
                    .first
    unless candidate.present?
      flash[:alert] = "This room is not open"
      redirect_to root_path
    end
    candidate
  end
end
