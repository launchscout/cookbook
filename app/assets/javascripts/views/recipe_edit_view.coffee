class Cookbook.RecipeEditView extends Backbone.View
  render: ->
    @el.html JST["templates/recipe_edit_view_template"] @model
    
  editRecipe: (recipe)->
    @model = recipe
    @render()
