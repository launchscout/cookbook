class Cookbook.IngredientView extends Backbone.View
  
  events:
    "click .display": "edit"
    "click #save": "save"
    "click .deleteIngredient": "delete"
    
  edit: ->
    @$(".display").hide()
    @$(".edit").show()
    
  display: ->
    @$(".edit").hide()
    @$(".display").show()
    
  save: ->
    @model.save({description: @$("input[name=description]").val()}, success: => @display())
  
  delete: (event)->
    event.stopPropagation()
    @model.destroy success: => @remove()

  constructor: ->
    super
    @model.bind "change", => @render()
    
  render: ->
    @el.html JST["templates/ingredient_view_template"] @model