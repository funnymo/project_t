class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]


  def index
    @products = current_admin.products
  end

  def new
    if current_admin
      @product = current_admin.products.build
    else
      redirect_to root_path, alert: "You do not have the permission to do that."
    end
  end

  def show
    @product_photos = @product.product_photos
  end

  def create
    @product = current_admin.products.build(product_params)
    if @product.save
      if params[:images]
        params[:images].each do |img|
          @product.product_photos.create(image: img)
        end
      end
      @product_photos = @product.product_photos
      redirect_to edit_product_path(@product), notice: "Saved..."
    else
      flash[:alert] = "Please provide all information required."
      render :new
    end
  end

  def edit
    @product_photos = @product.product_photos
  end

  def update
    if @product.update(product_params)
      if params[:images]
        params[:images].each do |img|
          @product.product_photos.create(image: img)
        end
      end
      redirect_to edit_product_path(@product), notice: "Updated..."
    else
      flash[:alert] = "Please provide all information required."
      render :edit
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_type, :category, :size, :product_name, :description, :stock, :price)
  end

end
