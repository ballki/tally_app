module ApplicationHelper
def resource_name
    :business
  end

  def resource
    @resource ||= Business.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:business]
  end
end
