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
    
      
  
  