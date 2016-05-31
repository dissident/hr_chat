class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:create_room, :create_hr]

  def index
    if user_signed_in? && current_user.hr?
      @clean_users = User.where('role = ? and open = ?', User::CANDIDATE_ROLE, false)
      @hrs = User.where(role: User::HR_ROLE).where.not(id: current_user.id)
    end
    @open_rooms = User.where(open: true)
  end

  def create_room
    if current_user.hr?
      candidate = User.find(params[:id])
      candidate.open = true
      candidate.opener = current_user.id
      candidate.save
      flash[:notice] = "room was opened"
    else
      flash[:alert] = "you must be hr for this operration"
    end
    redirect_to root_path
  end

  def create_hr
    if current_user.hr?
      hr = User.find(params[:id])
      hr.role = User::HR_ROLE
      hr.save
      flash[:notice] = "now user is hr"
    else
      flash[:alert] = "you must be hr for this operration"
    end
    redirect_to root_path
  end

end
