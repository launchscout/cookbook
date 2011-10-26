describe "RecipesRouter", ->
  beforeEach ->
    setFixtures("<div id='recipe_view'></div>")
    @recipe = new Cookbook.Recipe(title: "Pizza", id: 2)
    @recipes = new Cookbook.Recipes([@recipe])
    @recipesRouter = new Cookbook.RecipesRouter(@recipes)
  describe "view recipe", ->
    beforeEach ->
      @ingredient = new Cookbook.Ingredient description: "2 qts of goo"
      @recipesRouter.viewRecipe(2)
      mostRecentAjaxRequest().response
        status: 200
        responseText: JSON.stringify([@ingredient])
    it "should render the ingredients", ->
      expect($("#recipe_view")).toHaveText /goo/