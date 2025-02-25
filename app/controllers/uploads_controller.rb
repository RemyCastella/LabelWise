class UploadsController < ApplicationController
  protect_from_forgery with: :null_session  # Prevent CSRF issues for API-like requests

  def create
    if params[:image].present?
      uploaded_io = params[:image]
      filename = "#{SecureRandom.uuid}.jpg"  # Generate a unique filename
      filepath = Rails.root.join("public", "uploads", filename)

      # Save image to public/uploads
      File.open(filepath, "wb") { |file| file.write(uploaded_io.read) }

      render json: { message: "Upload successful", image_url: "/uploads/#{filename}" }, status: :ok
    else
      render json: { error: "No image received" }, status: :unprocessable_entity
    end
  end
end
