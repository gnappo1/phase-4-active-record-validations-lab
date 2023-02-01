class AuthorsController < ApplicationController

    def index
        render json: Author.all, status: 200
    end

    def show
        author = Author.find(params[:id])
        render json: author, status: 200
    end
end
