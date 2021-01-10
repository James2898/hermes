class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = Shop.joins(:employees).select("
      shops.*,
      employees.first_name  as emp_first_name,
      employees.last_name   as emp_last_name,
      employees.email       as emp_email
    ").first
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
    status = false
    respond_to do |format|
      if @shop.save
        @employee = @shop.employees.create!(
          :shop_id    => @shop.id,
          :first_name => shop_params['first_name'],
          :last_name  => shop_params['last_name'],
          :email      => shop_params['email'],
          :password   => shop_params['password'],
          :employee_type => '1'
        )
        @shop.update(:employee_id => @employee.id)
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:employee_id, :shop_name, :plan, :first_name, :last_name, :email, :password)
    end
end
