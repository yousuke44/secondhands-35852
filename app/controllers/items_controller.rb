class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_q, only: [:index, :search]
  before_action :move_to_index, except: [:index, :search, :new, :create]
  before_action :move_to_top, only: [:edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def search
    @results = @q.result.order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :year_period_id, :lecture, :teacher, :sales_status_id, :scheduled_delivery_id, :author, :publisher, :image).merge(user_id: current_user.id)
  end

  def set_q
    @q = Item.ransack(params[:q])
  end

  def move_to_index
    @item = Item.find(params[:id])
  end

  def move_to_top
    redirect_to root_path unless @item.order.blank?
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
