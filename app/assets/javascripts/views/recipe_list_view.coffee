class Cookbook.RecipeListView extends Backbone.View
  
  constructor: ->
    super
    @recipes = new Cookbook.Recipes()
    @recipes.fetch success: => @render()
      
  render: ->
    @el.append("<ul></ul>")
    @$("ul").append("<li>#{recipe.get("title")}</li>") for recipe in @recipes.models