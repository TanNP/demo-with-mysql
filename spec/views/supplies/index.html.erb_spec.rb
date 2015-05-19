require 'rails_helper'

RSpec.describe "supplies/index", type: :view do
  before(:each) do
    assign(:supplies, [
      Supply.create!(
        :companyName => "Company Name",
        :contactname => "Contactname",
        :phone => "Phone",
        :email => "MyText",
        :address => "MyText",
        :product => nil
      ),
      Supply.create!(
        :companyName => "Company Name",
        :contactname => "Contactname",
        :phone => "Phone",
        :email => "MyText",
        :address => "MyText",
        :product => nil
      )
    ])
  end

  it "renders a list of supplies" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contactname".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
