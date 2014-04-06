class StaticPagesController < ApplicationController
  before_action :authenticate_business!, only: [:home, :customer_home]
  def home

    @businesses = Business.all
  end

  def about
  end

  def help
  end

  def customer_home
    @businesses = Business.all
  end

  def frontpage
  end

end
