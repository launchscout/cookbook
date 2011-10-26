class Cookbook.Recipe extends Backbone.Model
  urlRoot: "/recipes"
  
  constructor: ->
    super
    @ingredients = new Cookbook.Ingredients([], recipe: @)
  