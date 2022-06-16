class Public::RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    user = User.find(params[:user_id])
    room = Room.where(host_id: current_user.id, guest_id: user.id).or(Room.where(host_id: user.id, guest_id: current_user.id)).first
    unless room
     room = Room.create(host_id: current_user.id, guest_id: user.id)
    end
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
    user_ids = [@room.host_id, @room.guest_id]
    user_ids.delete(current_user.id)
    @user = User.find(user_ids.first)
    @messages = @room.messages
    @message = Message.new(room: @room)
  end

  def index
  end

end
