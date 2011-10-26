class Cookbook.RecipeView extends Backbone.View

  events:
    "click #newIngredient": "newIngredient"
    "click #deleteRecipe": "delete"

  render: ->
    @el.html JST["templates/recipe_view"] @model
    @renderIngredients()
    @el.show()

  hide: -> @el.hide()
  
  delete: ->
    @model.destroy(success: => @hide())
  
  renderIngredients: ->
    @ingredientViews = (@addIngredientView(ingredient) for ingredient in @model.ingredients.models)
  
  addIngredientView: (ingredient) ->
    ingredientView = new Cookbook.IngredientView
      el: $("<li></li>").appendTo @$("#ingredients")
      model: ingredient
    ingredientView.render()
    ingredientView

  newIngredient: ->
    view = @addIngredientView(new Cookbook.Ingredient(recipe_id: @model.id))
    view.edit()
    @ingredientViews.push(view)
    