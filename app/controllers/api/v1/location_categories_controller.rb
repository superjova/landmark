class API::V1::LocationCategoriesController < API::V1Controller
  def index
    @location_categories = LocationCategory.all.order("location_categories.position ASC")
  end
end
