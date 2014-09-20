module Api
	class LocationPointsController < ApplicationController
		respond_to :json

		def index
			locationPoints = LocationPoint.all.select{ |obj| ((obj.dist1.to_f > 0) && (obj.dist2.to_f > 0) && (obj.dist3.to_f > 0))}
			if(params[:macAddr] != nil)
				macAddr = params[:macAddr]
				locationPoints = locationPoints.select{|obj| obj.macAddr == macAddr}
			end
			render json: locationPoints, status: 200
		end

		def show
			locationPoint = LocationPoint.find(params[:id])
			render json: locationPoint, status: 200
		end

		def create
			respond_with :api, locationPoint = LocationPoint.create(params.require(:location_point).permit(:dist1, :dist2, :dist3, :timeSent, :storeID, :macAddr))
		end
	end
end