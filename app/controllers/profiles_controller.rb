class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update]
  before_action :set_profile, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    if @profile.update!(profile_params)
      redirect_to user_profile_path(@profile)
    else
      render 'edit'
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)
  end
end
