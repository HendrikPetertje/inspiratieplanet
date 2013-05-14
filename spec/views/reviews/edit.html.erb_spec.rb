require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :title => "MyString",
      :author => "MyString",
      :content => "MyText",
      :rating => 1,
      :article => nil
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path(@review), :method => "post" do
      assert_select "input#review_title", :name => "review[title]"
      assert_select "input#review_author", :name => "review[author]"
      assert_select "textarea#review_content", :name => "review[content]"
      assert_select "input#review_rating", :name => "review[rating]"
      assert_select "input#review_article", :name => "review[article]"
    end
  end
end
