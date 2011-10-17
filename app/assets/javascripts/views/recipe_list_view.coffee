class Cookbook.RecipeListView extends Backbone.View
  recipes: ["pancakes"]
  
  render: ->
    @el.append("<ul></ul>")
    @$("ul").append("<li>#{recipe}</li>") for recipe in @recipes