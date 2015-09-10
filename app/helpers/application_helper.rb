module ApplicationHelper
  def user_information
    "#{current_user.followers} followers. You are following #{current_user.following}"
  end
end
