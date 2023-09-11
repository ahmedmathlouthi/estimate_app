# frozen_string_literal: true

class EstimatesController < ApplicationController
  before_action :set_estimate, only: %i[show edit update destroy validate]
  before_action :check_validation!, only: %i[update destroy]

  def index
    @estimates = Estimate.all
  end

  def show; end

  def edit; end

  def new
    @estimate = Estimate.new
  end

  def destroy
    @estimate.destroy!

    redirect_to estimates_path, warning: "Estimate #{@estimate.label} deleted successfully"
  end

  def create
    @estimate = Estimate.create!(estimate_params)

    if @estimate.save
      redirect_to estimates_url, notice: 'Estimate was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @estimate.update(estimate_params)
      redirect_to edit_estimate_url(@estimate), notice: 'Estimate was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_estimate
    @estimate = Estimate.find(params[:id])
  end

  def estimate_params
    params.require(:estimate)
          .permit(
            :label,
            :date,
            :validated
          )
  end
end
