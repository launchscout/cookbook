describe "RecipeView", ->
  beforeEach ->
    setFixtures("<div id='recipe_view'></div>")
    @recipe = new Cookbook.Recipe
      title: "Bacon"
      description: "It's what's for dinner"
    @recipeView = new Cookbook.RecipeView
      model: @recipe
      el: $("#recipe_view")
    @recipeView.render()
  it "should render the recipe", ->
    expect(@recipeView.el.html()).toMatch /Bacon/
  describe "showing ingredients", ->
    beforeEach ->
      @ingredient = new Cookbook.Ingredient description: "some stuff"
      @recipe.ingredients = new Cookbook.Ingredients([@ingredient], recipe: @recipe)
      @recipeView.renderIngredients()
    it "should display the ingredients", ->
      expect(@recipeView.$("li:first")).toHaveText /stuff/
      
    
    
      
  
  