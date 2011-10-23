class Cookbook.RecipeListView extends Backbone.View
  
  constructor: ->
    super
    @collection.fetch success: => @render()
      
  render: ->
    @el.append("<ul></ul>")
    @$("ul").append("<li><a href='#recipes/#{recipe.id}'>#{recipe.get("title")}</a></li>") for recipe in @collection.models