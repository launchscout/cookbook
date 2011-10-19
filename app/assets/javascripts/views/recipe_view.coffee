class Cookbook.RecipeView extends Backbone.View
  render: ->
    @el.html JST["templates/recipe_view"] @model