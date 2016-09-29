require 'line/bot'

module Bots
  class Line
    def self.client
      @client ||= ::Line::Bot::Client.new { |config|
        config.channel_secret = Settings.line.LINE_CHANNEL_SECRET
        config.channel_token  = Settings.line.LINE_CHANNEL_TOKEN
      }
    end
  end
end
