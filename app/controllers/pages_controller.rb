class PagesController < ApplicationController
	skip_before_action :authenticated_user!, only: [:home]

	layout 'session', only: [:home]

  def home
  end
end
