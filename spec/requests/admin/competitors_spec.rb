require 'rails_helper'

RSpec.describe "Admin::Competitors", type: :request do
  describe "GET /admin/competitors/new" do
    it "shows the form for creating a competitor" do
      get new_admin_competitor_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /admin/competitors" do
    let(:competitor_name) { 'Real Madrid' }

    it "shows the form for creating a competitor" do
      post admin_competitors_path, params: { competitor: { name: competitor_name } }
      expect(response).to have_http_status(302)
      expect(flash.notice).to eq("Competitor #{competitor_name} has been created")
    end
  end
end
