class CommentsController < ApplicationController
  def index
    if params[:user_id]
      commentable = User.find(params[:user_id])
    elsif params[:contact_id]
      commentable = Contact.find(params[:contact_id])
    end

    render json: commentable.comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages,
        status: :unprocessable_entity
    end
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    render json: comment
  end

  private

  def comment_params
    params.require(:comment)
      .permit(:text, :commentable_id, :commentable_type)
  end
end
