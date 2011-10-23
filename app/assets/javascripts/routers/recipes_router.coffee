class Cookbook.RecipesRouter extends Backbone.Router
  constructor: (recipes)->
    @recipes = recipes
    super
    
  routes:
    "recipes/:id": "viewRecipe"
    "recipes/:id/edit": "editRecipe"
    
  viewRecipe: (id)->
    @recipeView or= new Cookbook.RecipeView el: $("#recipe_view")
    @recipeView.viewRecipe(@recipes.get(id))
    
  editRecipe: (id)->
    @recipeView.hide() if @recipeView?
    @recipeEditView or= new Cookbook.RecipeEditView el: $("#recipe_edit")
    @recipeEditView.editRecipe(@recipes.get(id))
    