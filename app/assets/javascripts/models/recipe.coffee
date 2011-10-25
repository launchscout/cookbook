class Cookbook.Recipe extends Backbone.Model
  urlRoot: "/recipes"
  
  constructor: ->
    super
    @ingredientCollection = new Cookbook.Ingredients(@)
    
  ingredients: ->
    @ingredientCollection.fetch()
    []