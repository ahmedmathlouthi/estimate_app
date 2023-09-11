# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  def check_validation!
    return unless @estimate

    redirect_to root_path, warning: 'You cannot edit validated estimate' if @estimate.validated
  end
end
