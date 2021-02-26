class SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]

  # GET /spaces or /spaces.json
  def index
    @spaces = Space.all
    @orders = Order.all 
    get_week
    get_time
  end

  # GET /spaces/1 or /spaces/1.json
  def show
  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces or /spaces.json
  def create
    @space = Space.new(space_params)

    respond_to do |format|
      if @space.save
        format.html { redirect_to root_path, notice: "Space was successfully created." }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces/1 or /spaces/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: "Space was successfully updated." }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1 or /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: "Space was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def space_params
      params.permit(:start_time, :end_time)
    end

    def get_week
      wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
  
      # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
      @todays_date = Date.today
      # 例)　今日が2月1日の場合・・・ Date.today.day => 1日
  
      @week_days = []
  
      # plans = Plan.where(date: @todays_date..@todays_date + 6)
  
      7.times do |x|
        # today_plans = []
        # plan = plans.map do |plan|
        #   today_plans.push(plan.plan) if plan.date == @todays_date + x
        # end
  
        wday_num =  @todays_date.wday + x
  
        if wday_num > 6 
          wday_num = wday_num -7
        end
  
        days = {month: (@todays_date + x).month, date: (@todays_date+x).day, wday: wdays[wday_num]}  # daysに月日曜日を代入
        @week_days.push(days) # daysを@week_daysに追加
      end

      def get_time
        @hours = []
        start_time = Time.now
        end_time = start_time + 1.hour
        9.times do
          @hours << start_time << end_time
          start_time = start_time + 1.hour
        end
      end
  
    end
end
