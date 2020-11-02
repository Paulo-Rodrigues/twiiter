class Twiits::RepliesController < RepliesController
  before_action :set_replieable

  private

  def set_replieable
    @replieable = Twiit.find(params[:twiit_id])
  end
end
