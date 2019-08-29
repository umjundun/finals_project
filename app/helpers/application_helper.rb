module ApplicationHelper
  def engage_author(engagement)
    user_signed_in? && current_user.id == engagement.user_id
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
