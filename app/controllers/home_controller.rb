class HomeController < ApplicationController
  def index
    @message_logs = MessageLog.all
  end
end
