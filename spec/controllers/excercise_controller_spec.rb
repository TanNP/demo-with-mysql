require 'rails_helper'

RSpec.describe ExcerciseController, type: :controller do

  describe "GET #excercise1" do
    it "returns http success" do
      get :excercise1
      expect(response).to have_http_status(:success)
    end
  end

end
