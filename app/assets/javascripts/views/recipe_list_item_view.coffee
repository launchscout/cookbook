class Cookbook.RecipeListItemView extends Backbone.View
  
  constructor: ->
    super
    @model.bind "change", => @render()
    
  render: ->
    @el.html "<a href='#recipes/#{@model.id}'>#{@model.get("title")}</a>"