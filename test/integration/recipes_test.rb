require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "pedro", email: "pedro@example.com")
    @recipe = Recipe.create(name: "fish and vegetable green", description: "great vegetable green, oil for 10 minutes", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "fish and potatoes or tomatoes", description: "delicious fish with some rice and potatoes or tomatoes, ready for 15 minutes")
    @recipe2.save
  end
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
