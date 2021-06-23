class HomeController < ApplicationController
  def index
    redirect_to vaccinations_path if redirect_referer.include? request.referer
  end

  private

  def redirect_referer
    ["http://localhost:3000/users/sign_up", "http://localhost:3000/users/sign_in"]
  end
end
