class Cookbook.RecipesRouter extends Backbone.Router
  constructor: (recipes)->
    @recipes = recipes
    @recipeView or= new Cookbook.RecipeView el: $("#recipe_view")
    super
    
  routes:
    "recipes/:id": "viewRecipe"
    "recipes/:id/edit": "editRecipe"
    
  viewRecipe: (id)->
    recipe = @recipes.get(id)
    @recipeView.model = recipe
    recipe.ingredients.fetch success: => @recipeView.render()
    
  editRecipe: (id)->
    @recipeEditView or= new Cookbook.RecipeEditView el: $("#recipe_edit")
    @recipeView.hide() if @recipeView?
    @recipeEditView.editRecipe(@recipes.get(id))
    