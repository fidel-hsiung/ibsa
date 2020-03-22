class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  def index
    if params[:good_search].present?
      @good_search = GoodSearch.new(good_search_params)
    else
      @good_search = GoodSearch.new
    end
    @goods = @good_search.records.page(params[:page]).per(10)
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

  def bulk_new
  end

  def bulk_create
    @response = {}
    if params[:goods_csv].present?
      @response = GoodsBulkUpload.new(csv: params[:goods_csv]).build
    end
  end

  private
  def set_good
    @good = Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:category, :name, :source, :destination, :consignment_id, :entry_at, :exit_at, :left_facility)
  end

  def good_search_params
    params.require(:good_search).permit(:category, :name, :source, :destination, :consignment_id, :entry_at_day, :exit_at_day, :left_facility)
  end
end
