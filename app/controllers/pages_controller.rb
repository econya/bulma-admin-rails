class PagesController < ApplicationController
  def home
  end

  def changelog
  end

  def dashboard
  end

  def forms
  end

  def presentations
  end

  def tables
  end

  def ui_elements
  end

  def notifications
    rand(1..6).times do
      flash_type = [:info, :success, :error, :alert, :notice].sample
      flash[flash_type] = "A flash of type #{flash_type}"
    end
  end

  def login
    render layout: 'blank'
  end
end
