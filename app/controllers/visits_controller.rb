class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:create, :new, :index]
  # before_action :create, :authenticate_business!
  layout 'checkin', :only => :new

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    @visit.business_id = current_business.id
    @req_visits = current_business.req_visits
    @reward = current_business.reward
    @name = current_business.name
    @logo = current_business.logo
    @photo = current_business.photo
    # render layout: false

  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json

  def create
    # render json: params

    @customer = Customer.find_by(email: params[:email])
    # Check to see if customer already exists, if not, create a new customer and save
      if !@customer
        @customer = Customer.new(email: params[:email], password:'1234')
        @customer.save
      end

    # Define variables
    @visit = Visit.new
    @visit.business_id = current_business.id
    @visit.customer_id = @customer.id
    @visit_count=Visit.where(customer_id:@customer.id, business_id:current_business.id).count + 1
    #anticipate number of visits after saving
    @req_visits = current_business.req_visits
    
    @reward = current_business.reward
    
    if @req_visits.to_i != 0
      @since_last_reward = @visit_count % @req_visits.to_i
    else
      @since_last_reward = 0
    end

    # Check how many visits customer has until reward and display in notice
    if @visit_count < @req_visits.to_i
      @notice = '<p>You only need to visit <p>' + 
      (@req_visits.to_i - @since_last_reward).to_s + ' more times to earn ' + @reward.to_s + '!'
    elsif @visit_count == 1 #first time visit
      @notice = '<p>Welcome to Tally App. Keep visiting to get awesome rewards'
    elsif @since_last_reward == 0
          @earned_reward = Reward.new(customer_id:@customer.id, business_id:current_business.id, reward:current_business.reward, redeemed:false, 
            redeemed_at:'')
          @earned_reward.save   
      @notice = '<p>You have earned ' + @reward.to_s + '!</p>'
    else
      @notice = '<p>You have visited ' + @since_last_reward.to_s + ' times since your last reward, and only need to visit ' + 
      (@req_visits.to_i - @since_last_reward).to_s + ' more times to earn ' + @reward.to_s + '!</p>'
    end

    # Save visit and show message
    respond_to do |format|
      if @visit.save
        format.html { redirect_to new_visit_path, notice: '<h1>THANKS FOR COMING</h1> ' + @notice }
        format.json { render action: 'show', status: :created, location: @visit }
      else
        format.html { render action: 'new' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end


  def forBusiness
    render "visits/bybusiness"
  end

  def forCustomer
    render "visits/bycustomer"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      # params.require(:visit).permit(:business_id, :customer_id)
    end
end
