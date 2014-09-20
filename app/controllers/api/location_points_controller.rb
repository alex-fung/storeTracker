module Api
	class LocationPointsController < ApplicationController
		respond_to :json

		def index
			locationPoints = LocationPoint.all
			render json: locationPoints, status: 200
		end

		def show
			locationPoint = LocationPoint.find(params[:id])
			render json: locationPoint, status: 200
		end

		def create
			respond_with :api, locationPoint = LocationPoint.create(params.require(:location_point).permit(:dist1, :dist2, :dist3, :timeSent, :storeID))
		end
	end
end