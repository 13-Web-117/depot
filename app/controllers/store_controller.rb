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
      @item1 = Product.last
      @item2 = Product.order('id desc').offset(1).first
      @item3 = Product.order('id desc').offset(2).first
    end
  end
  
  def show
    @products = Product.where(category_id: params[:category_id])
  end
  
  def search
    @products = Product.search(params[:title])
  end
end
