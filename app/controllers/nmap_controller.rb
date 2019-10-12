class NmapController < ApplicationController
  def index
    parser = Import::ImportXml.call("./app/data/nmap.results.xml")
    render json: { her: 1, parser: parser }
  end
end
