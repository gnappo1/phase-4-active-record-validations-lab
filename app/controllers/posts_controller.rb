class PostsController < ApplicationController

    def index
        if params[:author_id]
            author = Author.find(params[:author_id])
            render json: author.created_posts, status: 200
        else
            render json: Post.all, status: 200
        end
    end

    def create
        if params[:author_id]
            # find the correct author (if any)
            author = Author.find(params[:author_id])
            author.created_posts.create!(post_params)
            render json: author.created_posts.last, status: 201
            # find the associated posts and give them to the frontend
        else
            post = Post.create!(post_params)
            # if post.id
            render json: {post: author.created_posts.last}, status: 201
            # else
                # render json: post.errors.full_messages.to_s, status: 400
            # end
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :author_id, :summary, :category)
    end
end
