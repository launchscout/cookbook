class Cookbook.RecipeEditView extends Backbone.View
  render: ->
    @el.html JST["templates/recipe_edit_view_template"] @model
    
  editRecipe: (recipe)->
    @model = recipe
    @render()
    
  save: ->
    @model.set
      title: @$("input[name=title]").val()
      description: @$("textarea[name=description]").val()
