require 'action_controller'

class MetalController < ActionController::Metal
  include Rack::Tracker::Controller
  include AbstractController::Rendering
  include ActionView::Layouts
  append_view_path File.join(File.dirname(__FILE__), '../fixtures/views')
  layout 'application'

  def index
    tracker do
      track_all_the_things like: 'no-one-else'
      another_handler likes: 'you'
    end
    render "metal/index"
  end
end
