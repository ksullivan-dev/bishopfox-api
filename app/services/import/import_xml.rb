require 'nmap/parser'

class Import::ImportXml < ApplicationService
  def initialize(file)
    @file = file
  end

  def call
    parser = Nmap::Parser.parsefile(@file)
    return parser
  end

#   private

end