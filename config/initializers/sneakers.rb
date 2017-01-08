# frozen_string_literal: true
require 'sneakers'

Sneakers.configure Rails.application.secrets.rabbitmq
