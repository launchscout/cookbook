class Cookbook.RecipesRouter extends Backbone.Router
  constructor: (recipes)->
    @recipes = recipes
    @recipeView or= new Cookbook.RecipeView el: $("#recipe_view")
    @recipeEditView or= new Cookbook.RecipeEditView el: $("#recipe_edit")
    super
    
  routes:
    "recipes/new": "newRecipe"
    "recipes/:id": "viewRecipe"
    "recipes/:id/edit": "editRecipe"
    
  newRecipe: ->
    @recipeView.hide() if @recipeView?
    newRecipe = new Cookbook.Recipe()
    newRecipe.bind "change", => @recipes.add(newRecipe)
    @recipeEditView.model = newRecipe
    @recipeEditView.render()
    
  viewRecipe: (id)->
    recipe = @recipes.get(id)
    @recipeView.model = recipe
    recipe.ingredients.fetch success: => @recipeView.render()
    
  editRecipe: (id)->    
    @recipeView.hide() if @recipeView?
    @recipeEditView.model = @recipes.get(id)
    @recipeEditView.render()
    