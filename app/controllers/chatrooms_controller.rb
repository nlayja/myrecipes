class ChatroomsController < ApplicationController

  def show
    @messages = Message.new
    @messages = Message.all
    #@messages = Message.most_recent
  end

end
