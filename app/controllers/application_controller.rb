class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def not_found(error)
        render json: {error: "#{error.model} not found!"}, status: 400
    end

    def invalid_record(raised_error)
        render json: {error: raised_error.record.errors}, status: 400
    end
end
