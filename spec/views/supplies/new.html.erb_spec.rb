require 'rails_helper'

RSpec.describe "supplies/new", type: :view do
  before(:each) do
    assign(:supply, Supply.new(
      :companyName => "MyString",
      :contactname => "MyString",
      :phone => "MyString",
      :email => "MyText",
      :address => "MyText",
      :product => nil
    ))
  end

  it "renders new supply form" do
    render

    assert_select "form[action=?][method=?]", supplies_path, "post" do

      assert_select "input#supply_companyName[name=?]", "supply[companyName]"

      assert_select "input#supply_contactname[name=?]", "supply[contactname]"

      assert_select "input#supply_phone[name=?]", "supply[phone]"

      assert_select "textarea#supply_email[name=?]", "supply[email]"

      assert_select "textarea#supply_address[name=?]", "supply[address]"

      assert_select "input#supply_product_id[name=?]", "supply[product_id]"
    end
  end
end
