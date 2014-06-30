class Message
  include SqsUsable

  def receive_message(type)
    super
  end
end
