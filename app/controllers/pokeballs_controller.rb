class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    random_chance = rand(1..2)
    if random_chance == 1
      @pokeball.save
      redirect_to trainer_path(@pokeball.trainer), notice: "You caught a Pokemon!"
    else
      flash[:alert] = "Your pokeball missed! Try again!"
      render "pokemons/show"
    end
  end

  def destroy
    @pokeball = Pokeball.find(params[:id])
    @pokeball.destroy
    redirect_to trainer_path(@pokeball.trainer), notice: "Sqreah! #{@pokeball.pokemon.name} has been released!", status: :see_other
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
