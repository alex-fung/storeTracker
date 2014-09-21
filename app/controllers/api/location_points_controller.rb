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
			if params[:id].to_i == 1
				id = "2467"
			elsif params[:id].to_i == 2
				id = "12284"
			else
				id = "54317"
			end

			array = LocationPoint.all.select{ |obj| ((obj.dist1.to_f > 0) && (obj.dist2.to_f > 0) && (obj.dist3.to_f > 0))}

			array = array.sort_by {|obj| obj.timeSent}
				
			array1 = array.select{|obj| obj.beac1 == id}
			array2 = array.select{|obj| obj.beac2 == id}
			array3 = array.select{|obj| obj.beac3 == id}
			                                                         
			array1 = array1.map{|obj| obj.dist1}
			array2 = array2.map{|obj| obj.dist2}
			array3 = array3.map{|obj| obj.dist3}
			array = array1 + array2 + array3

			render json: array, status: 200
		end

		def create
			respond_with :api, locationPoint = LocationPoint.create(params.require(:location_point).permit(:dist1, :dist2, :dist3, :timeSent, :beac1, :beac2, :beac3, :macAddr))
		end

		def destroy
			LocationPoint.find(params[:id]).destroy
			head :no_content
		end

		def deleteAll
			LocationPoint.all.each { |point| point.destroy}
			head :no_content
		end
	end
end