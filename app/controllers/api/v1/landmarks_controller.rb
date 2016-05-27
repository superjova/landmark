class API::V1::LandmarksController < API::V1Controller
  def show
    @landmark = Landmark.nearest_to(params[:location])

    if @landmark
      render "api/v1/landmarks/show"
    else
      render :not_found
    end
  end
end
