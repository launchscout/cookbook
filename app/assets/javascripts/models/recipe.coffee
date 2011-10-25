class Cookbook.Recipe extends Backbone.Model
  urlRoot: "/recipes"
  
  constructor: ->
    super
    @ingredientCollection = new Cookbook.Ingredients(@)
    
  ingredients: ->
    @ingredientCollection.fetch(success: => @ingredientCollection.fetched = true) unless @ingredientCollection.fetched?
    @ingredientCollection.models