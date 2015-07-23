class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.valid?
      comment.save
      flash[:success] = "the comment was successfully sent."
    else
      flash[:error] = "there was a problem with your comment, please try again."
    end
    redirect_to "/concerts/#{comment_params[:concert_id]}"
  end

  private

  def comment_params
    filetered_params = params.require(:comment).permit(:username, :content)
    filetered_params[:concert_id] = params[:concert_id]
    filetered_params
  end
end
