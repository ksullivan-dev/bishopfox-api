class Api::V1::ScansController < ApiController
    def index
      render json: { scans: Scan.all }
    end

    def show
      @scan = Scan.find(params[:id])
      render json: @scan, :include => {:hosts => {:include => :ports}}
    end

    def create
      data = Import::ImportXml.call(params[:imported_file].path)
      if data[:success]
        render json: { redirect: true, redirect_url: "/scans/" + data[:scan][:id].to_s }
      else
        render json: { message: "Import Failed", data: data }
      end
    end

    def destroy
      @scan = Scan.find(params[:id])
      @scan.destroy
      render json: { redirect: true, redirect_url: "/scans" }
    end
end
