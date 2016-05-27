class API::V1::LocationsController < API::V1Controller
  def index
    @locations = Location.near_to(params[:location]).where(location_category_id: params[:location_category_ids])
    render "api/v1/locations/index"
  end
end
