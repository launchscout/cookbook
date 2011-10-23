#= require jquery
#= require_npm underscore
#= require_npm backbone
#= require_self
#= require_tree .

@Cookbook = {}

$ ->
  window.recipes = new Cookbook.Recipes()
  window.recipesRouter = new Cookbook.RecipesRouter(recipes)
  window.recipeListView = new Cookbook.RecipeListView(el: $("#recipe_list"), collection: recipes)
  Backbone.history.start()