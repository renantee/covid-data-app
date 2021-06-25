class HomeController < ApplicationController
  def index
    redirect_to vaccinations_path if redirect_referer.include? request.referer
  end

  private

  def redirect_referer
    [
      "http://localhost:3000/register",
      "http://localhost:3000/login",
      "https://nante-covid-data.herokuapp.com/register",
      "https://nante-covid-data.herokuapp.com/login",
      "http://nante-covid-data.herokuapp.com/register",
      "http://nante-covid-data.herokuapp.com/login"
    ]
  end
end
