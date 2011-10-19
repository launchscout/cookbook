#= require jquery
#= require_npm underscore
#= require_npm backbone
#= require_self
#= require_tree .

@Cookbook = {}

$ ->
  new Cookbook.RecipeListView(el: $("#recipe_list_view")).render()