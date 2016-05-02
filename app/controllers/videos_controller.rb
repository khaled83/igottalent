class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1/approve
  def approve
    video = Video.find(params[:id])
    # slot = Slot.available.first
    slot = Slot.create(start_time: Time.now.beginning_of_hour, end_time: Time.now.beginning_of_hour + (15*60), type: video.type, genre: video.genre, user: video.user )
    unless slot
    end
    video.slot =slot
    redirect_to video
  end

  # PATCH/PUT /videos/1/approve
  def disapprove
    video = Video.find(params[:id])
    slot = video.slot
    video.slot = nil
    slot.destroy
    # video.update(slot_id: nil)
    # slot.update(video_id: nil)
    redirect_to video
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    redirect_to slots_path
    # respond_to do |format|
    #   format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def slot_update(slot)
    @video = Video.find(params[:id])
    @slot = Slot.new
    @video.slot = @slot
    @slot.video = @video
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :genre, :url, :duration_in_seconds, :user_id)
    end
end
