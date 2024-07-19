class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    if params[:search]
      @pokemons = @pokemons.where("name ILIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokeball = Pokeball.new(pokemon: @pokemon, caught_on: Date.today)
  end

  def random
    @pokemon = Pokemon.order("RANDOM()").first
    @pokeball = Pokeball.new(pokemon: @pokemon, caught_on: Date.today)
    render :show
  end
end
