module BusinessesHelper
def resource_name
    :business
  end

  def resource
    @resource ||= Business.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:business]
  end
  
  # def current_business
  # 	if admin_signed_in?
  # 		current_business = @businesses
  # 	end
  # end
end
