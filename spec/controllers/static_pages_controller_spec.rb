require 'spec_helper'

describe StaticPagesController do

  describe "GET 'impressum'" do
    it "returns http success" do
      get 'impressum'
      expect(response).to be_success
    end
  end

end
