class Cookbook.RecipeListView extends Backbone.View
  
  constructor: ->
    super
    @collection.fetch success: => @render()
      
  render: ->
    @el.append("<ul></ul>")
    @itemViews = for recipe in @collection.models
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