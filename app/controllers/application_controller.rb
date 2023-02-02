class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def not_found
        render json: {error: "Record not found with id #{params[:id]}!"}, status: 400
    end

    def invalid_record(raised_error)
        render json: {error: raised_error.record.errors.full_messages.to_sentence}, status: 400
    end
end
