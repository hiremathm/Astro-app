class BasicHeroscopesController < ApplicationController
  before_action :set_basic_heroscope, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :update, :destroy]
  # GET /basic_heroscopes
  # GET /basic_heroscopes.json
  def index
    @basic_heroscopes = BasicHeroscope.all
    @basic_heroscope = BasicHeroscope.new
  end

  # GET /basic_heroscopes/1
  # GET /basic_heroscopes/1.json
  def show
  end

  # GET /basic_heroscopes/new
  def new
    @basic_heroscope = BasicHeroscope.new
  end

  # GET /basic_heroscopes/1/edit
  def edit
  end

  # POST /basic_heroscopes
  # POST /basic_heroscopes.json
  def create
    @basic_heroscope = BasicHeroscope.new(basic_heroscope_params)
    @basic_heroscope.user_id = current_user.id
    respond_to do |format|
      if @basic_heroscope.save
        format.html { redirect_to @basic_heroscope, notice: 'Basic heroscope was successfully created.' }
        format.json { render :show, status: :created, location: @basic_heroscope }
      else
        format.html { render :new }
        format.json { render json: @basic_heroscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_heroscopes/1
  # PATCH/PUT /basic_heroscopes/1.json
  def update
    respond_to do |format|
      if @basic_heroscope.update(basic_heroscope_params)
        format.html { redirect_to @basic_heroscope, notice: 'Basic heroscope was successfully updated.' }
        format.json { render :show, status: :ok, location: @basic_heroscope }
      else
        format.html { render :edit }
        format.json { render json: @basic_heroscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_heroscopes/1
  # DELETE /basic_heroscopes/1.json
  def destroy
    @basic_heroscope.destroy
    respond_to do |format|
      format.html { redirect_to basic_heroscopes_url, notice: 'Basic heroscope was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_heroscope
      @basic_heroscope = BasicHeroscope.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_heroscope_params
      params.require(:basic_heroscope).permit(:name, :date,:time , :lat, :lon, :tzone, :ascendant, :varna, :vashya, :yoni, :gana, :nadi, :rashi_adipathi, :rashi, :nakshtra, :nakshtra_adipathi, :charan, :yog, :karan, :tithi, :yunja, :tatva, :name_alphabet, :paya, :birth_place, :user_id)
    end
end
