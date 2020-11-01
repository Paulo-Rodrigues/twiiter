class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(_user)
    twiits_path
  end
end
