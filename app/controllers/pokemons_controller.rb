class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    if params[:search]
      @pokemons = @pokemons.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def random
    @pokemon = Pokemon.order("RANDOM()").first
    render :show
  end
end
