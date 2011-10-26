#= require ./recipe_list_item_view
class Cookbook.RecipeListView extends Backbone.View
  
  constructor: ->
    super
    @collection.fetch success: => @render()
    @collection.bind "add", (recipe) => @addItemView(recipe)
      
  render: ->
    @el.html JST["templates/recipe_list_view_template"] @model
    @itemViews = @addItemView(recipe) for recipe in @collection.models

  addItemView: (recipe) ->
    itemView = new Cookbook.RecipeListItemView
      el: $("<li></li>").appendTo @$("ul")
      model: recipe
    itemView.render()
    itemView
