class Cookbook.IngredientView extends Backbone.View
  
  constructor: ->
    super
    @model.bind "change", => @render()
    
  render: ->
    @el.html JST["templates/ingredient_view_template"] @model