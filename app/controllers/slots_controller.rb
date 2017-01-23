class SlotsController < ApplicationController
  before_action :set_slot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_fb

  # GET /slots
  # GET /slots.json
  def index
    # number of items per page
    cur_page = params[:page]
    per_page = 3
    @slots = Slot.paginate(page: cur_page, per_page: per_page).order('created_at DESC')

    @filling_slots = []
    if( @slots.length < per_page )
      filling_count = per_page - @slots.length
      @filling_slots = Slot.paginate(page: cur_page.to_i-1, per_page: filling_count).order('created_at DESC')
    end
    puts "*** #Slots = #{@slots.length}"
    # session[:fb_code] = params[:code] if params[:code]
  end

  # GET /slots/1
  # GET /slots/1.json
  def show
  end

  # GET /slots/new
  def new
    @slot = Slot.new
  end

  # GET /slots/1/edit
  def edit
  end

  # POST /slots
  # POST /slots.json
  def create
    @slot = Slot.new(slot_params)

    respond_to do |format|
      if @slot.save
        format.html { redirect_to @slot, notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: @slot }
      else
        format.html { render :new }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slots/1
  # PATCH/PUT /slots/1.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to @slot, notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot }
      else
        format.html { render :edit }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  def video_edit
    @slot = Slot.find(params[:id])
    @video = Video.new
    @slot.video = @video
    @video.slot = @slot
  end

  def video_update
  end

  # DELETE /slots/1
  # DELETE /slots/1.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to slots_url, notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    LikeVideo.like(params[:id], current_user.id)
    redirect_to slots_path
  end

  def dislike
    LikeVideo.dislike(params[:id], current_user.id)
    redirect_to slots_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end

    def last_page?
      @slots.current_page == @slots.total_pages
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slot_params
      params.require(:slot).permit(:start_time, :end_time, :type, :genre, :user_id, :video_id)
    end
end
