class Replies::RepliesController < RepliesController
  before_action :set_replieable

  private

  def set_replieable
    @replieable = Reply.find(params[:reply_id])
  end
end
