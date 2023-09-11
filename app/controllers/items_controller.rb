# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]
  before_action :set_estimate, only: %i[new edit update destroy create]
  before_action :check_validation!, only: %i[create update destroy]

  def new
    @item = @estimate.items.new
  end

  def edit;end

  def create
    @item = @estimate.items.create!(item_params)

    if @item.save
      redirect_to estimate_url(@estimate), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to estimate_items_url(@item, @estimate.id), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    redirect_to estimate_url(@estimate), notice: 'Item was deleted updated.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_estimate
    @estimate = Estimate.find(params[:estimate_id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :quantity, :vat_rate)
  end
end
