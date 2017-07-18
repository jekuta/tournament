module Command
  module Execute
    def execute(command)
      handler_for(command).call(command)
    end

    private

    def handler_for(command)
      {
        Command::AddPlayer => CommandHandler::AddPlayer.new,
        Command::StartCompetition => CommandHandler::StartCompetition.new
      }.fetch(command.class)
    end
  end
end
