class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      flash[:notice] = 'Good was successfully created.'
      redirect_to edit_good_path(@good)
    else
      render :new
    end
  end

  def update
    if @good.update(good_params)
      flash[:notice] = 'Good was successfully updated.'
      redirect_to edit_good_path(@good)
    else
      render :edit
    end
  end

  def destroy
    @good.destroy
    flash[:notice] = 'Good was successfully destroyed.'
    redirect_to goods_url
  end

  private
  def set_good
    @good = Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:category, :name, :source, :destination, :consignment_id, :entry_at, :exit_at, :left_facility)
  end
end
