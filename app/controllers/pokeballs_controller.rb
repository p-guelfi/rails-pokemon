class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    @pokeball.caught_on = Date.today
    random_chance = rand(1..2)
    if random_chance == 1
      @pokeball.save
      redirect_to pokemon_path(@pokemon)
    else
      redirect_to pokemon_path(@pokemon), alert: "Your pokeball missed! Try again!"
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location)
  end
end
