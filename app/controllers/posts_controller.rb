class PostsController < ApplicationController

    def index
        render json: Post.all, status: 200
    end

    def create
        # byebug
        post = Post.create!(post_params)
        # if post.id
        render json: post, status: 201
        # else
            # render json: post.errors.full_messages.to_s, status: 400
        # end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :author_id, :summary, :category)
    end
end
