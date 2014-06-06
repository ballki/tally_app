class StaticPagesController < ApplicationController
  before_action :authenticate_business!, only: [:home, :customer_home]
  def home
    @businesses = Business.all
    @today = DateTime.now.to_date
    @tm1 = DateTime.now.to_date - 1
    @tm2 = DateTime.now.to_date - 2
    @tm3 = DateTime.now.to_date - 3
    @tm4 = DateTime.now.to_date - 4
    @tm5 = DateTime.now.to_date - 5
    @tm6 = DateTime.now.to_date - 6
    @tm7 = DateTime.now.to_date - 7

  if Visit.all.count != 0
    @todaycount = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@today.to_s).beginning_of_day..Date.parse(@today.to_s).end_of_day)).count
    @tm1count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm1.to_s).beginning_of_day..Date.parse(@tm1.to_s).end_of_day)).count
    @tm2count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm2.to_s).beginning_of_day..Date.parse(@tm2.to_s).end_of_day)).count
    @tm3count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm3.to_s).beginning_of_day..Date.parse(@tm3.to_s).end_of_day)).count
    @tm4count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm4.to_s).beginning_of_day..Date.parse(@tm4.to_s).end_of_day)).count
    @tm5count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm5.to_s).beginning_of_day..Date.parse(@tm5.to_s).end_of_day)).count
    @tm6count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm6.to_s).beginning_of_day..Date.parse(@tm6.to_s).end_of_day)).count
    @tm7count = Visit.where(:business_id => current_business.id,created_at: (Date.parse(@tm7.to_s).beginning_of_day..Date.parse(@tm7.to_s).end_of_day)).count
  
    # Generating random values
    @todaycount = rand(40)
    @tm1count = rand(40)
    @tm2count = rand(40)
    @tm3count = rand(40)
    @tm4count = rand(40)
    @tm5count = rand(40)
    @tm6count = rand(40)
    @tm7count = rand(40)

    # get the largest tm
    @l_value = [
      @todaycount, 
      @tm1count, 
      @tm2count, 
      @tm3count, 
      @tm4count, 
      @tm5count, 
      @tm6count, 
      @tm7count
      ].max

  end


  end

  def about
  end

  def help
  end

  def customer_home
    @businesses = Business.all
  end

  def frontpage
 render :layout => false
  end

  def admin
      @businesses = Business.all
  end


end
