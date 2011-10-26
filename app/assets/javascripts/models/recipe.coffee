class Cookbook.Recipe extends Backbone.Model
  urlRoot: "/recipes"
  
  constructor: ->
    super
    @ingredientCollection = new Cookbook.Ingredients([], recipe: @)
    
  ingredients: ->
    @ingredientCollection.fetch(
      success: => 
        @ingredientCollection.fetched = true
        @trigger("change")
    ) unless @ingredientCollection.fetched?
    @ingredientCollection.models