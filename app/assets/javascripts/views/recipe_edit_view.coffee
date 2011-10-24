class Cookbook.RecipeEditView extends Backbone.View
  
  events: 
    "click input[value=Save]": "save"
    
  render: ->
    @el.html JST["templates/recipe_edit_view_template"] @model
    
  editRecipe: (recipe)->
    @model = recipe
    @render()
    @el.show()
    
  save: (event)->
    event.preventDefault()
    @model.set
      title: @$("input[name=title]").val()
      description: @$("textarea[name=description]").val()
    @model.save {}, 
      success: => @close()
      error: => @displayErrors()
  
  close: ->
    @el.hide()
    window.location.hash = "recipes/#{@model.id}"
