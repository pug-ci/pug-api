# frozen_string_literal: true
require 'sneakers'

config = Rails.application.secrets.rabbitmq
amqp = "amqp://#{config[:username]}:#{config[:password]}@#{config[:host]}:#{config[:port]}"

Sneakers.configure amqp: amqp,
                   workers: 1,
                   prefetch: 5,
                   threads: 5

Sneakers.logger = Logger.new(IO::NULL)
