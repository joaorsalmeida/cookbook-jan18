class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
  end

  def create
    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                                  :cook_time, :ingredients, :method,
                                                  :difficulty)

    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      @recipe_types = RecipeType.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      redirect_to new_recipe_path
    end
  end
end
