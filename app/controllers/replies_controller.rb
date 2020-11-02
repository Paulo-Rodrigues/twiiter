class RepliesController < ApplicationController
  def create
    reply = @replieable.replies.build(reply_params)
    reply.user = current_user
    reply.save
    flash[:notice] = 'Resposta enviada'
    redirect_back(fallback_location: root_path)
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
