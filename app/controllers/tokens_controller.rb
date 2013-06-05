class TokensController < ApplicationController
  def create
    user = User.find_by_name(params[:user_name])

    if user.password == params[:password]
      user.tokens << Token.new
      render :json => user.tokens.last.value
    else
      render :text => "Wrong username/password combination"
    end
  end

  def destroy
    user = Token.find_by_value(params[:token]).user
    user.tokens.each do |token|
      token.destroy
    end

    render :text => "successful logout"
  end

end
