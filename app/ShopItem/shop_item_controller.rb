require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ShopItemController < Rho::RhoController
  include BrowserHelper

  # GET /ShopItem
  def index
    @shop_items = ShopItem.find(:all)
    render :back => '/app'
  end

  # GET /ShopItem/{1}
  def show
    @shop_item = ShopItem.find(@params['id'])
    if @shop_item
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /ShopItem/new
  def new
    @shop_item = ShopItem.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /ShopItem/{1}/edit
  def edit
    @shop_item = ShopItem.find(@params['id'])
    if @shop_item
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /ShopItem/create
  def create
    @shop_item = ShopItem.create(@params['shop_item'])
    redirect :action => :index
  end

  # POST /ShopItem/{1}/update
  def update
    @shop_item = ShopItem.find(@params['id'])
    @shop_item.update_attributes(@params['shop_item']) if @shop_item
    redirect :action => :index
  end

  # POST /ShopItem/{1}/delete
  def delete
    @shop_item = ShopItem.find(@params['id'])
    @shop_item.destroy if @shop_item
    redirect :action => :index  
  end
end
