# This is visits controller
class VisitsController < ApplicationController
  def create
    @data = []
    params['_json'].each do |param|
      @web_visit = Visit.new(visit_params(param))
      @web_visit.page_views.build(views_params(param))
      if @web_visit.save
        @data << @web_visit
      end
    end
  end

  private

  def visit_params(param)
    param.permit(:referrerName, :idSite, :idVisit, :visitIp, :visitoriId)
  end

  def views_params(param)
    param.permit(actionDetails: [:pageTitle, :timeSpent, :position,:url])[:actionDetails]
  end
end
