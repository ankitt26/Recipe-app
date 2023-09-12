require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  let(:recipe) {
    Recipe.create!(
      name: "MyString",
      preparation_time: "MyString",
      cooking_time: "MyString",
      description: "MyString",
      public: false,
      user_id: 1
    )
  }

  before(:each) do
    assign(:recipe, recipe)
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(recipe), "post" do

      assert_select "input[name=?]", "recipe[name]"

      assert_select "input[name=?]", "recipe[preparation_time]"

      assert_select "input[name=?]", "recipe[cooking_time]"

      assert_select "input[name=?]", "recipe[description]"

      assert_select "input[name=?]", "recipe[public]"

      assert_select "input[name=?]", "recipe[user_id]"
    end
  end
end
