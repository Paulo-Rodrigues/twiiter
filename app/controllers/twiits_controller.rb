class TwiitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_twiit, only: %i[show destroy]

  def index
    @twiits = Twiit.all
    @twiit = Twiit.new
  end

  def show; end

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
    @twiit.destroy if @twiit.owner?(current_user)
    flash[:notice] = 'Deletado'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_twiit
    @twiit = Twiit.find(params[:id])
  end

  def twiit_params
    params.require(:twiit).permit(:text)
  end
end
