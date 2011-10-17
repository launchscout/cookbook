describe "RecipeListView", ->
  beforeEach ->
    setFixtures("<div id='recipe_list_view'></div>")
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe_list_view"))
    @recipeListView.render()
  it "should output some json", ->
    expect(@recipeListView.$("li:first").html()).toMatch /pancakes/