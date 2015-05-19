require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :title => "MyString",
      :author => "MyString",
      :rating => 1,
      :content => "MyText",
      :product => nil
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_title[name=?]", "comment[title]"

      assert_select "input#comment_author[name=?]", "comment[author]"

      assert_select "input#comment_rating[name=?]", "comment[rating]"

      assert_select "textarea#comment_content[name=?]", "comment[content]"

      assert_select "input#comment_product_id[name=?]", "comment[product_id]"
    end
  end
end
