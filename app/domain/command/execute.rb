module Command
  module Execute
    def execute(command)
      handler_for(command).call(command)
    end

    private

    def handler_for(command)
      {
        Command::StartCompetition => CommandHandler::StartCompetition.new,
        Command::FinishCompetition => CommandHandler::FinishCompetition.new,
        Command::AddPlayer => CommandHandler::AddPlayer.new,
        Command::AddPointsForPlayer => CommandHandler::AddPointsForPlayer.new
      }.fetch(command.class)
    end
  end
end
