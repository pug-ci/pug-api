# frozen_string_literal: true
require 'active_model_serializers'

ActiveModelSerializers.logger = Logger.new(IO::NULL)
