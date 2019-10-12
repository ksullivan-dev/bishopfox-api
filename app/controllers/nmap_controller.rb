class NmapController < ApplicationController
  def index
    render json: { controller: "nmap" }
  end
end
