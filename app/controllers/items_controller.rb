class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :add_to_cart] 

  def index
    @items = Item.page(params[:page]).per(6)
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)  # eager loading
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: '成功新增餐點!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: '成功更新餐點!'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: '成功刪除餐點'
  end

  def add_to_cart
    current_cart.add_item(@item.id)
    session[:carty] = current_cart.to_hash
    
    render json: { items_count: current_cart.items.count }
  end

  private
  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, 
                                 :description, 
                                 :price, 
                                 :category_id,
                                 :cover,
                                 :spec)
  end
end
