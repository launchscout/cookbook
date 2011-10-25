class Cookbook.RecipeView extends Backbone.View
  render: ->
    @el.html JST["templates/recipe_view"] @model
    @renderIngredients()
    @el.show()

  hide: -> @el.hide()
      
  renderIngredients: ->
    @ingredientViews = for ingredient in @model.ingredients.models
      ingredientView = new Cookbook.IngredientView
        el: $("<li></li>").appendTo @$("#ingredients")
        model: ingredient
      ingredientView.render()
      ingredientView
      