class CounterController < WebsocketRails::BaseController
  def hello
    Viewer.increment_counter(:count,1)
    @count = Viewer.first.count
    send_message :update, @count
  end

  def goodbye
    Viewer.decrement_counter(:count,1)
    @count = Viewer.first.count
    send_message :update, @count
  end
end
