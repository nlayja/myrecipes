class ChatroomsController < ApplicationController

  def show
    @messages = Message.most_recent
  end

end
