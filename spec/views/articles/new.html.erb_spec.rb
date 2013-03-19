require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :title => "MyString",
      :content => "MyText",
      :picture => "MyString",
      :tags => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path, :method => "post" do
      assert_select "input#article_title", :name => "article[title]"
      assert_select "textarea#article_content", :name => "article[content]"
      assert_select "input#article_picture", :name => "article[picture]"
      assert_select "input#article_tags", :name => "article[tags]"
      assert_select "input#article_user_id", :name => "article[user_id]"
    end
  end
end
