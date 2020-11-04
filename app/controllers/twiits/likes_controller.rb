class Twiits::LikesController < LikesController
  before_action :set_likeable

  private

  def set_likeable
    @likeable = Twiit.find(params[:twiit_id])
  end
end
