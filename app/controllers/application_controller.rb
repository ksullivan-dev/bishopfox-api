class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def frontend_index_html
    render file: 'public/index.html'
  end
end
