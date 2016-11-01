#require "slack_api_wrapper"
#require "channel"



class HomepagesController < ApplicationController
  def index
    @data = Slack_Api_Wrapper.list_channels
  end

  def create
    response = Slack_Api_Wrapper.send_message(params[:channel], params[:message])
    redirect_to root_path

    if response["ok"]
      flash[:notice] = "Message Sent Successfully to #{params[:channel]}"
    else
      flash[:notice] = "Message failed to be sent to #{params[:channel]}"
    end

  end

  def new
    @channel = params[:name]
    @channel_id = params[:id]
  end
end
