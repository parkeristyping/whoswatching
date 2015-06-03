class CounterController < WebsocketRails::BaseController
  def hello
    Viewer.increment_counter(:count,1)
    @count = Viewer.first.count
    WebsocketRails[:updates].trigger(:update, @count)
  end

  def goodbye
    unless Viewer.first.count == 0
      Viewer.decrement_counter(:count,1)
    end
    @count = Viewer.first.count
    WebsocketRails[:updates].trigger(:update, @count)
  end
end
