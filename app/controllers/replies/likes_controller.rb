class Replies::LikesController < LikesController
  before_action :set_likeable

  private

  def set_likeable
    @likeable = Reply.find(params[:reply_id])
  end
end
