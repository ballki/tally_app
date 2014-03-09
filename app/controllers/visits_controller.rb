class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]
  # before_action :create, :authenticate_business!

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
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    
    @customer = Customer.find_by(email: params[:email])
    if !@customer
      @customer = Customer.new(email: params[:email], password:'1234')
      @customer.save
    end

    @visit = Visit.new
    @visit.business_id = current_business.id
    @visit.customer_id = @customer.id

    respond_to do |format|
      if @visit.save
        format.html { redirect_to business_visits_path(@visit), notice: 'Visit was successfully created.' }
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
