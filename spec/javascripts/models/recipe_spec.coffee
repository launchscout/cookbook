describe "RecipeSpec", ->
  beforeEach ->
    @recipe = new Cookbook.Recipe(title: "Pizza", id: 2)
  describe "ingredients", ->
    describe "when ingredients are not yet loaded", ->
      beforeEach ->
        @ingredients = @recipe.ingredients()
        @request = mostRecentAjaxRequest()
      it "returns an empty list", ->
        expect(@ingredients).toEqual([])
      it "requests the ingredients via ajax", ->
        expect(@request).toRequest
          method: "GET"
          url: "/recipes/2/ingredients"
    describe "loading the ingredients", ->
      beforeEach ->
        @ingredient = new Cookbook.Ingredient description: "2 qts of goo"
        @recipe.fetchIngredients (ingredients)->
          @ingredients = ingredients
        mostRecentAjaxRequest().response
          status: 200
          responseText: JSON.stringify([@ingredient])
      it "returns the already fetched ingredients", ->
        expect(@ingredients()[0].get("description")).toMatch /goo/
