describe "RecipeListView", ->
  beforeEach ->
    setFixtures("<div id='recipe_list_view'></div>")
    @recipe = new Cookbook.Recipe title: "yummy pancakes"
    @recipes = new Cookbook.Recipes([@recipe])
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe_list_view"), collection: @recipes)
    @recipeListView.render()
  it "should output some json", ->
    expect(@recipeListView.$("li:first").html()).toMatch /pancakes/
    
  describe "changing the recipe", ->
    beforeEach ->
      @recipe.set title: "yummy waffles"
    it "should change the list item", ->
      expect(@recipeListView.$("li:first").html()).toMatch /waffles/