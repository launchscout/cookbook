describe "RecipeListView", ->
  beforeEach ->
    setFixtures("<div id='recipe_list_view'></div>")
    @recipes = new Cookbook.Recipes([{title: "yummy pancakes"}])
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe_list_view"), collection: @recipes)
    @recipeListView.render()
  it "should output some json", ->
    expect(@recipeListView.$("li:first").html()).toMatch /pancakes/