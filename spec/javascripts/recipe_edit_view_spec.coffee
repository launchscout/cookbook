describe "EditRecipeSpec", ->
  beforeEach ->
    setFixtures("<div id='recipe_edit_view'></div>")
    @recipe = new Cookbook.Recipe(title: "Food", description: "It is delicious.")
    @recipeEditView = new Cookbook.RecipeEditView(el: $("#recipe_edit_view"))

  describe "edit", ->
    beforeEach ->
      @recipeEditView.editRecipe(@recipe)
    it "should have inputs", ->
      expect(@recipeEditView.$("input[name=title]").val()).toEqual @recipe.get("title")
      expect(@recipeEditView.$("textarea[name=description]").val()).toEqual @recipe.get("description")
  
  describe "saving", ->
    beforeEach ->
      @recipeEditView.editRecipe(@recipe)
      @recipeEditView.$("input[name=title]").val("the new title")
      @recipeEditView.$("textarea[name=description]").val("the new description")
      @recipeEditView.save(new jQuery.Event)
    it "should update the model", ->
      expect(@recipe.get("title")).toEqual "the new title"
      expect(@recipe.get("description")).toEqual "the new description"
  
    