class LikesController < ApplicationController
  def create
    current_user.like(@likeable)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unlike(@likeable)

    redirect_back(fallback_location: root_path)
  end
end
