class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to vender_path(params[:vender_id])
  end

  def destroy
    @vender = Vender.find(params[:vender_id])
      comment = @vender.comments.find(params[:id])
      if current_user.id == comment.user.id
        comment.destroy
      redirect_to vender_path(params[:vender_id])
      else
        render "venders/show"
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, vender_id: params[:vender_id])
  end
end
