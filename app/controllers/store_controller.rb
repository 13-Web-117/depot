class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.paginate page: params[:page], 
                                   order: 'title desc', 
                                   per_page: 4
      @cart = current_cart
      @parent_categories = ParentCategory.all
    end
  end
  
  def show
    @products = Product.where(category_id: params[:category_id])
    @cart = current_cart
    @parent_categories = ParentCategory.all
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { "json" }
      format.js
    end
  end
end
