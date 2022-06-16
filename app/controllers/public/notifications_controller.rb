class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_user.receive_notifications.page(params[:page])
    @notifications.where(checked: false).each do |notification|
      @notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notifications = current_user.send_notifications.destroy_all
    redirect_to notifications_path
  end
end
