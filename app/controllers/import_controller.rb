class ImportController < ApplicationController
    def index
        data = Import::ImportXml.call('./app/data/nmap.results.xml')
        render json: { message: 'this is the import controller', data: data }
    end
end
