class FeedController < ApplicationController
  before_action :authorize!

  def show

  end

  private

  def authorize!
    redirect_to root_path unless current_user
  end
end
