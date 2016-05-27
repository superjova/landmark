class Admin::LandmarksController < AdminController
  def index
    @landmarks = Landmark.all.order("lower(name)")
  end

  def new
    @landmark = Landmark.new
  end

  def create
    @landmark = Landmark.new(landmark_params)

    if @landmark.save
      redirect_to admin_landmarks_path
    else
      render :new
    end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:name, :address, :remote_image_url)
  end
end
