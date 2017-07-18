module Admin
  class OneOffCompetitionsController < ApplicationController
    def create
      redirect_to admin_one_off_competition_path(id: SecureRandom.uuid)
    end

    def show
      competition_id = params.fetch(:id)
      stream = "Aggregate::Competition$#{competition_id}"
      competition = Aggregate::Competition.new(competition_id).load(stream)

      render :show, locals: { competition: competition }
    end
  end
end
