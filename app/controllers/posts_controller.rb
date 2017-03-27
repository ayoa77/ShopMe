class PostsController < ApplicationController
    def index
        @posts = Post.order('created_at DESC')

        @posts = @posts.search_posts params[:query] if params[:query] # .page(params[:page]).per_page(3) for pagination
    
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render 'new', notice: 'Sorry, something went wrong! Please try again.'
        end
    end

    private

    def post_params
        params.require(:post).permit(:description,
                                     :price,
                                     :user_id,
                                     :website,
                                     :post_photo,
                                     :remove_post_photo)
    end
end
