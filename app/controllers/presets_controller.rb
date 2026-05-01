class PresetsController < ApplicationController
  def index
    @presets = Preset.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
