class ImportController < ApplicationController
    def index
      render json: { message: 'this is the import controller', scans: Scan.all }, :include => {:hosts => {:include => :ports}}
    end

    def create
      data = Import::ImportXml.call(params[:imported_file].path)
      if data
        render json: { message: "NMAP XML imported successfully", data: data, scans: Scan.all }, :include => {:hosts => {:include => :ports}}
      else
        render json: { message: "Import Failed", data: data }
      end

    end
end
