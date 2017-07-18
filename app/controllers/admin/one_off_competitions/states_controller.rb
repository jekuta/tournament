module Admin
  module OneOffCompetitions
    class StatesController < ApplicationController
      include Command::Execute

      def create
        cmd = Command::StartCompetition.new(competition_id: competition_id)

        execute(cmd)

        redirect_to admin_one_off_competition_path(id: competition_id)
      end

      private

      def competition_id
        params.permit(:one_off_competition_id).fetch(:one_off_competition_id)
      end
    end
  end
end
