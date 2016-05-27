class API::V1::LocationsController < API::V1Controller
  def index
    @locations = Location.includes(:location_tags).near_to(params[:location]).filter(location_category_ids: params[:location_category_ids], tag_ids: params[:tag_ids])
    render "api/v1/locations/index"
  end
end
