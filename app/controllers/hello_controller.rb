class HelloController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render 'test/show'
  end
  
end
