require 'rails_helper'

RSpec.describe "Admin::Competitors", type: :request do
  describe "GET /admin/competitors/new" do
    it "shows the form for creating a competitor" do
      get new_admin_competitor_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /admin/competitors" do
    it "shows the form for creating a competitor" do
      post admin_competitors_path, params: { name: 'Real Madrid' }
      expect(response).to have_http_status(200)
    end
  end
end
