class SqsReceiveWorker
  include Sidekiq::Worker

  def perform(queue_name)
    collection = MessageCollection.new(queue_name)

    if messages = collection.receive_message
      messages.each do |message|
        # TODO: 何かしらの処理…
        puts "message: #{message}"
      end

      collection.batch_delete(messages)
    end

    SqsReceiveWorker.perform_in(1.second, queue_name)
  end
end
