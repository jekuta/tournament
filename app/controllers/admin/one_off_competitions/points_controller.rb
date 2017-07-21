module Admin
  module OneOffCompetitions
    class PointsController < ApplicationController
      include Command::Execute

      def create
        cmd = Command::AddPointsForPlayer.new(
          player_id: player_id,
          competition_id: competition_id,
          points: points
        )

        execute(cmd)

        redirect_to admin_one_off_competition_path(id: competition_id)
      end

      private

      def player_id
        params.permit(:player).fetch(:player)
      end

      def points
        params.permit(:points).fetch(:points)
      end

      def competition_id
        params.permit(:one_off_competition_id).fetch(:one_off_competition_id)
      end
    end
  end
end
