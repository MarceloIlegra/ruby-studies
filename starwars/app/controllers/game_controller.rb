class GameController < ApplicationController
  
  def index

  	@user = User.new(name: "Marcelo", age: 25)

  	render json: @user
  end

end
