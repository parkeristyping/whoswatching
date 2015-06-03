class CounterController < WebsocketRails::BaseController
  def hello
    @count = Viewer.increment_counter(:count,1)
    send_message :update, @count
  end

  def goodbye
    @count = Viewer.decrement_counter(:count,1)
    send_message :update, @count
  end
end