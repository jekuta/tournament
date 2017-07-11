class Admin::CompetitorsController < ApplicationController
  def index
    render :index, locals: { competitors: Competitor.all }
  end

  def new
    render :new
  end

  def create
    if competitor = Competitor.create(competitor_params)
      flash.notice = "Competitor '#{competitor.name}' has been created"
      redirect_to admin_competitors_path
    else
      render :new
    end
  end

  private

  def competitor_params
    params.require(:competitor).permit(:name)
  end
end
