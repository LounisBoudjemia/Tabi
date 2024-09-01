class ChecklistTemplatesController < ApplicationController
  def show
    @checklist_template = ChecklistTemplate.find(params[:id])
  end
end
