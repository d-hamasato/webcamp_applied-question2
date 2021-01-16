class ChatsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    
    unless user_rooms.nil?
      @room = user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end
  
  def create
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    chat.save
    redirect_to request.referer
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end
end