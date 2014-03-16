class StaticPagesController < ApplicationController
  def home
  	if current_business
  	@name = current_business.name
    @logo = current_business.logo
  	end
  end

  def about
  end

  def help
  end
end
