require 'spec_helper'

describe "favorites/index" do
  before(:each) do
    assign(:favorites, [
      stub_model(Favorite,
        :user_id => 1,
        :article_id => 2
      ),
      stub_model(Favorite,
        :user_id => 1,
        :article_id => 2
      )
    ])
  end

  it "renders a list of favorites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
