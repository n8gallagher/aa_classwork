class LikesController < ApplicationController

    def index
        if params[:likeable_type] = 'Comment'
            likes = Like.find_by(user_id: params[:user_id])
        elsif params[:artwork_id]
            likes = Like.find_by(artwork_id: params[:artwork_id])
        end
        render json: likes
    end

    def create
        like = Like.new(like_params)
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        like = Like.find(params[:id])
        like.delete
        render json: like
    end

    private

    def like_params
        params.require(:likes).permit(:likeable_id, :likeable_type)
    end

end