class User < ActiveRecord::Base
  def self.create_user! (user_params)
    @userSession = SecureRandom.base64
    user_params[:session_token] = @userSession
    create!(user_params)
  end
end