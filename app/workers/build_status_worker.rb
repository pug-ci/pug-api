# frozen_string_literal: true
class BuildStatusWorker
  include Sneakers::Worker
  from_queue 'pug.builds.status', env: nil

  def work(raw_message)
    message = JSON.parse raw_message

    build = Build.find message['id']

    if build.update status: message['status']
      ack!
    else
      reject!
    end
  end
end
