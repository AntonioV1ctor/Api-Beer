# frozen_string_literal: true

class BeersController < ApplicationController
  # GET /beers
  def index
    @beers = Beer.all
    render json: @beers, status: :ok
  end

  # GET /beers/:id
  def show
    @beer = Beer.find_by(id: params[:id])
    if @beer
      render json: @beer
    else
      render json: @Beer, status: :not_found
    end
  end

  # GET /beers/random
  def random
    @beer = Beer.order('RAND()').first
    render json: @beer, status: :ok
  end

  # POST /beers
  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer, status: :created
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  # PUT /beers/:id
  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      render json: @beer, status: :ok
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beers/:id
  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    head :no_content
  end

  private

  # Strong parameters
  def beer_params
    params.require(:beer).permit(:name, :description, :image_url)
  end
end
