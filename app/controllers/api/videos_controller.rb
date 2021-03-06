class Api::VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    render json: @videos
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    render json: @video
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.save!
    render json: @video
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    @video.update(video_params)
    render json: @video
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    render nothing: true, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :url, :description)
    end
end
