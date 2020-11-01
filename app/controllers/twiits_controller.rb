class TwiitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @twiits = Twiit.all
    @twiit = Twiit.new
  end

  def create
    @twiit = current_user.twiits.build(twiit_params)

    if @twiit.save
      flash[:notice] = 'Postado'
    else
      flash[:error] = @twiit.errors.full_messages.first
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    twiit = Twiit.find(params[:id])
    twiit.destroy if twiit.owner?(current_user)
    flash[:notice] = 'Deletado'
    redirect_back(fallback_location: root_path)
  end

  private

  def twiit_params
    params.require(:twiit).permit(:text)
  end
end
