require 'rails_helper'

RSpec.describe "Admin::Teams", type: :request do
  describe "GET /admin/team/new" do
    it "shows the form for creating a team" do
      get new_admin_team_path
      expect(response).to have_http_status(200)
    end
  end
end
