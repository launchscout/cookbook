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
      jasmine.Ajax.useMock()
      @recipeEditView.editRecipe(@recipe)
      @recipeEditView.$("input[name=title]").val("the new title")
      @recipeEditView.$("textarea[name=description]").val("the new description")
      @recipeEditView.save(new jQuery.Event)
    it "should update the model", ->
      expect(@recipe.get("title")).toEqual "the new title"
      expect(@recipe.get("description")).toEqual "the new description"
      
  describe "displaying errors", ->
    beforeEach ->
      @recipeEditView.editRecipe(@recipe)
      errors = {title: ["is no good, no good at all"]}
      @recipeEditView.displayErrors @recipe, responseText: JSON.stringify(errors)
    it "should add an error tag to the container div", ->
      expect(@recipeEditView.$("div.clearfix:first")).toHaveClass "error"
    it "should display the error message", ->
      expect(@recipeEditView.$("span.help-inline")).toHaveText /no good/
      
  
    