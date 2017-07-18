module Admin
  module OneOffCompetitions
    class PlayersController < ApplicationController
      include Command::Execute

      def create
        player_id = SecureRandom.uuid

        cmd = Command::AddPlayer.new(
          id: player_id,
          name: player_params.fetch(:name),
          competition_id: competition_id
        )

        execute(cmd)

        redirect_to admin_one_off_competition_path(id: competition_id)
      end

      private

      def player_params
        params.require(:competitor).permit(:name)
      end

      def competition_id
        params.permit(:one_off_competition_id).fetch(:one_off_competition_id)
      end
    end
  end
end
