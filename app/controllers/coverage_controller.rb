# frozen_string_literal: true

# app/controllers/coverage_controller.rb
class CoverageController < ApplicationController
  def show
    path = params[:path]
    coverage_path = Rails.root.join('coverage', path)

    if File.exist?(coverage_path)
      send_file coverage_path, type: 'text/html', disposition: 'inline'
    else
      render plain: 'Arquivo não encontrado', status: :not_found
    end
  end
end
