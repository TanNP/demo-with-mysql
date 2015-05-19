class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    # @page = params['page'].to_i
    # @prev_page = @page - 1 unless @page == 0
    # @next_page = @page + 1 unless (@page*5 > Product.count) 
    # @products = Product.limit(5).offset(@page * 5)
    @products = Product.page(params['page'])
    # .order(:updated_at => :desc)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comment = Comment.new
  end

  # GET /products/new
  def new
    authorize! :create, @product
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    authorize! :update, @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
       users = User.where(admin: true)
        users.each do |user|
          ProductMail.addnew(user).deliver
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy 
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def authenticate
    authenticate_user! && current_user.try(:admin?)
    if !current_user.try(:admin?)
      redirect_to root_path
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :img, :price)
    end
end
