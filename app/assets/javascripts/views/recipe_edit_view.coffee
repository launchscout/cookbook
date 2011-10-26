class Cookbook.RecipeEditView extends Backbone.View
  
  events: 
    "click input[value=Save]": "save"
    
  render: ->
    @el.html JST["templates/recipe_edit_view_template"] @model
    @el.show()
    
  save: (event)->
    event.preventDefault()
    @model.bind "error", (recipe, response) => @displayErrors(recipe, response)
    @model.set
      title: @$("input[name=title]").val()
      description: @$("textarea[name=description]").val()
    @model.save {}, 
      success: => @close()
  
  displayErrors: (recipe, response) ->
    errors = JSON.parse(response.responseText)
    @displayError(field, messages) for field, messages of errors
    
  displayError: (field, messages) ->
    fieldInput = @$("input[name=#{field}]")
    fieldInput.parent().parent().addClass("error")
    fieldInput.after("<span class='help-inline'>#{messages[0]}</span>")
    
  close: ->
    @el.hide()
    window.location.hash = "recipes/#{@model.id}"
