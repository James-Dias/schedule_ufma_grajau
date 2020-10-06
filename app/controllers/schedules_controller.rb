class SchedulesController < ApplicationController
  before_action :authorize_schedule
  before_action :set_schedule, only: [:show, :edit, :update, :destroy, :confirmation_schedules, :inativation_schedules]
  before_action :set_schedule_solicitation, only: [:solicitation_schedules]
  after_action :schedules_crowded, only: [:solicitation_schedules]

  # GET /schedules
  # GET /schedules.json
  def index
    @filterrific = initialize_filterrific(
      policy_scope(Schedule),
      params[:filterrific],
      select_options: {
                sorted_by: Schedule.options_for_sorted_by,
              },
      :persistence_id => false,
    ) or return

    @schedules = @filterrific.find.page(params[:page]).order(:day)
  end

  def multiple_schedules
    days = params[:schedule][:day]
    days_array = days.split(",")
    days_array.length
    for day in days_array do
      Schedule.create(day: day.to_s, spaces: params[:schedule][:spaces],
         status: params[:schedule][:status], user_id:params[:schedule][:user_id],
          department_id: params[:schedule][:department_id], hour_begin: params[:schedule][:hour_begin], hour_end: params[:schedule][:hour_end])
    end
    redirect_to schedules_path, notice: "Agendamento realizado com sucesso!"
  end

  def available_schedules
    @filterrific = initialize_filterrific(
      Schedule,
      params[:filterrific],
      select_options: {
                sorted_by: Schedule.options_for_sorted_by,
              },
      :persistence_id => false,
    ) or return

    @schedules = @filterrific.find.page(params[:page]).order(:day).where(status: :opened)
  end

  def solicitation_schedules
    if @schedule.occupation < @schedule.spaces
      if Solicitation.where(schedule: @schedule, user_id:current_user.id).blank?
        Solicitation.create(schedule: @schedule, user_id:current_user.id)
        @schedule.update(occupation: @schedule.occupation+1)
        redirect_to my_solicitations_path, notice: "Solicitação registrada!"
      else
        redirect_to available_schedules_path, alert: "Você já solicitou esse horário!"
      end
    end
  end

  def my_solicitations
    @schedules = Schedule.order(:day).joins(:solicitations)
    .where(solicitations:{user_id: current_user.id}).page params[:page]
  end

  def inativation_schedules
    @schedule.update(status: :canceled)
    redirect_to schedules_path, notice: "Agendamento cancelado!"
  end
  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authorize_schedule
    authorize Schedule
  end

  private
    def schedules_crowded
      if @schedule.occupation == @schedule.spaces
        @schedule.update(status: :crowded)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = policy_scope(Schedule).find(params[:id])
    end

    def set_schedule_solicitation
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:day, :hour_begin, :hour_end, :status, :user_id, :department_id, :spaces, :occupation)
    end
end
