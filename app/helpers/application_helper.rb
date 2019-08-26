module ApplicationHelper
  def engage_author(engagement)
    user_signed_in? && current_user.id == engagement.user_id
  end
end
