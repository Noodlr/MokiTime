class CommentsController < ApplicationController
  def create
    @device = Device.find(params[:device_id])
    @status = Status.find(comment_params[:status_id])
    @comment = @device.comments.create(comment_params)
    
    @device.update_attributes(:needs_to_be_contacted => @status.needs_to_be_contacted)
    
    redirect_to device_path(@device)
  end

  def destroy
    @device = Device.find(params[:device_id])
    @location = @device.location
    @comment.destroy
    redirect_to location_path(@location)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :status_id, :user_id)
    end
end
