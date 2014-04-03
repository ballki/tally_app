class StaticPagesController < ApplicationController
  def home
    if business_signed_in?
    @name = current_business.name
    @logo = current_business.logo
    @business = current_business
    @email    = current_business.email
    @street_address = current_business.street_address
    @phone    = current_business.phone
    @manager  = current_business.manager
    @reward   = current_business.reward
    @req_visits = current_business.req_visits
    @marketing_package = current_business.marketing_package
    @photo  = current_business.photo
    else
    render :action => 'frontpage'
    end
    @businesses = Business.all
  end

  def about
  end

  def help
  end

  def customer_home
        if current_business
    @name = current_business.name
    @logo = current_business.logo
    @business = current_business
    @email    = current_business.email
    @street_address = current_business.street_address
    @phone    = current_business.phone
    @manager  = current_business.manager
    @reward   = current_business.reward
    @req_visits = current_business.req_visits
    @marketing_package = current_business.marketing_package
    @photo  = current_business.photo
    end
    @businesses = Business.all
  end

  def frontpage

  end

end
