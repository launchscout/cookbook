#= require ../models/recipe
class Cookbook.Recipes extends Backbone.Collection
  url: "/recipes"
  model: Cookbook.Recipe