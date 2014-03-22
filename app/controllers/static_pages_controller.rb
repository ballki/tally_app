class StaticPagesController < ApplicationController
  def home
  	if current_business
  	@name = current_business.name
    @logo = current_business.logo
  	end

    @businesses = Business.all

  end

  def about
  end

  def help
  end
end
