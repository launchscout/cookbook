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