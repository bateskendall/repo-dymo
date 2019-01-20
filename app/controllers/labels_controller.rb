class LabelsController < ApplicationController
  
  def show
  end

  def search
    @labels = RepoDymo.get_labels(:repo)
  end
end
