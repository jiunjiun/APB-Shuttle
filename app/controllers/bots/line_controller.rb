class Bots::LineController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    body = request.body.read

    unless client.validate_signature(body, Settings.line.LINE_CHANNEL_SECRET)
      render text: 'Bad Request', status: 400 and return
    end

    events = client.parse_events_from(body)
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
          response = client.get_message_content(event.message['id'])
          tf = Tempfile.open("content")
          tf.write(response.body)
        end
      end
    }

    render text: "OK" and return
  end

  private
  def client
    @client = Bots::Line.client
  end
end
