class Cookbook.IngredientView extends Backbone.View
  
  events:
    "click .display": "edit"
    "click #save": "save"
    
  edit: ->
    @$(".display").hide()
    @$(".edit").show()
    
  display: ->
    @$(".edit").hide()
    @$(".display").show()
    
  save: ->
    @model.save({description: @$("input[name=description]").val()}, success: => @display())
  
  constructor: ->
    super
    @model.bind "change", => @render()
    
  render: ->
    @el.html JST["templates/ingredient_view_template"] @model