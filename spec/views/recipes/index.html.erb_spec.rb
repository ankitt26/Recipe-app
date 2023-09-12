require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        name: "Name",
        preparation_time: "Preparation Time",
        cooking_time: "Cooking Time",
        description: "Description",
        public: false,
        user_id: 2
      ),
      Recipe.create!(
        name: "Name",
        preparation_time: "Preparation Time",
        cooking_time: "Cooking Time",
        description: "Description",
        public: false,
        user_id: 2
      )
    ])
  end

  it "renders a list of recipes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Preparation Time".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cooking Time".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
