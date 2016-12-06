# frozen_string_literal: true
class Publisher
  def publish(message)
    connect do
      queue = channel.queue Rails.application.secrets.build_queue_name

      queue.publish message
    end
  end

  private

  def connect
    connection.start
    yield
    connection.stop
  end

  def connection
    @connection ||= Bunny.new
  end

  def channel
    connection.create_channel
  end
end
