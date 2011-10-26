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
      
    
class Cookbook.RecipeListItemView extends Backbone.View
  
  constructor: ->
    super
    @model.bind "change", => @render()
    
  render: ->
    @el.html "<a href='#recipes/#{@model.id}'>#{@model.get("title")}</a>"