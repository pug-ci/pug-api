# frozen_string_literal: true
class Publisher
  def publish(message)
    connect do
      queue = channel.queue Rails.application.secrets.build_queue_name, queue_options

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
    @connection ||= Bunny.new Rails.application.secrets.bunny
  end

  def channel
    connection.create_channel
  end

  def queue_options
    { durable: true }
  end
end
