class PostsController < ApplicationController
    before_action :require_logged_in, except: :show
    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        # @post[:sub_ids] = params[:post][:sub_ids].map(&:to_i)
        
        debugger
        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        unless @post.author_id == current_user.id && @post.update
            flash[:errors] = @post.errors.full_messages
        end
        redirect_to post_url(@post)
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.author_id == current_user.id 
            @post.destroy
            redirect_to subs_url
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end
