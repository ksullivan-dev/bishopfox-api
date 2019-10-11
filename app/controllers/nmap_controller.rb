require 'nmap/parser'

class NmapController < ApplicationController
  def index
    doc = File.open("./app/data/nmap.results.xml")

    parser = Nmap::Parser.parsefile(doc)
    render json: { her: 1, parser: parser }
  end
end
