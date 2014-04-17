class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:edit, :update, :show]
  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
   # business_params.user_id = current_user.id
    @business = current_user.businesses.new(business_params)

    respond_to do |format|
      if @business.save
          if admin_signed_in
        format.html { redirect_to root_path, notice: 'Business was successfully created.' } 
          else       
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
          end
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    # render json: business_params
    respond_to do |format|
      if @business.update(business_params)
     # @business.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end
  
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
  #   if admin_signed_in?
  #     current_business = @businesses
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :logo, :email, :street_address, :phone, :manager, :reward, :req_visits, :marketing_package, :photo)
    end
end
