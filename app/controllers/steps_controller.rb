class StepsController < ApplicationController
  #before_action :set_lists, only: [:show, :edit, :update, :destroy]

  # GET list/:list_id/steps
  # GET /steps.json
  def index
    @list = List.find(params[:list_id])
    @steps = @list.steps
  end

  # GET list/:list_id/steps/new
  # GET /steps/1.json
  def new
    @list = List.find(params[:list_id])
    @step = @list.steps.new()
  end

  # GET list/:list_id/steps/new
  def show
    @list = List.find(params[:list_id])
    @step = @list.steps.new()
  end
  # GET /steps/1/edit
  def edit
  end

  # POST list/:list_id/steps/new
  # POST /steps.json
  def create
    #@step = Step.new(step_params)
    @list = List.find(params[:list_id])
    @step = @list.steps.new(step_params)
    respond_to do |format|
      if @step.save
        format.html { redirect_to [@list, @step], notice: 'Step was successfully created.' }
        format.json { render action: 'show', status: :created, location: @step }
      else
        format.html { render action: 'new' }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:title, :body)
    end
end
