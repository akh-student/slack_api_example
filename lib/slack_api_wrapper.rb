require 'httparty'

class Slack_Api_Wrapper
  TOKEN = ENV["SLACK_TOKEN"]

  BASE_URL = "https://slack.com/api/"

  def self.list_channels
    url = BASE_URL + "channels.list?token=#{TOKEN}"

    response = HTTParty.get(url)
    my_channels = []
    response["channels"].each do |channel|
      id = channel["id"]
      name = channel["name"]
      my_channels << Slack_Channel.new(name, id)
    end

    my_channels
  end

  def self.send_message(channel, msg)
    # url = BASE_URL + "chat.postMessage?token=#{TOKEN}" + "&text=#{msg}" + "&channel=#{channel}"
    #
    # response = HTTParty.post(url)

    url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"

    data = HTTParty.post(url,
    body: {
      "text" => "#{msg}",
      "channel" => "#{channel}",
      "username" => "Pumpkin",
      "icon_emoji" => ":jack_o_lantern:",
      "as_user" => "false",
    },
    :headers => { 'Content-Type' => 'application/x-www-form-urlencoded'} )
  end


end
