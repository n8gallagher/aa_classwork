class CommentsController < ApplicationController

    def index
        if params[:user_id]
            comments = Comment.find_by(user_id: params[:user_id])
        elsif params[:artwork_id]
            comments = Comment.find_by(artwork_id: params[:artwork_id])
        end
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.delete
        render json: comment
    end

    private

    def comment_params
        params.require(:comments).permit(:user_id, :artwork_id, :body)
    end

end