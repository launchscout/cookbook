class Cookbook.RecipesRouter extends Backbone.Router
  routes:
    "recipes/:id": "viewRecipe"
    
  viewRecipe: (id)->
    @recipeView or= new Cookbook.RecipeView el: $("#recipe")
    @recipeView.setModel(new Cookbook.Recipe(id: id))
    