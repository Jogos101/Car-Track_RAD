class ReferenciaFipesController < ApplicationController
  before_action :set_referencia_fipe, only: %i[ show edit update destroy ]

  # GET /referencia_fipes
  def index
    @referencia_fipes = ReferenciaFipe.all
  end

  # GET /referencia_fipes/1
  def show
  end

  # GET /referencia_fipes/new
  def new
    @referencia_fipe = ReferenciaFipe.new
  end

  # GET /referencia_fipes/1/edit
  def edit
  end

  # POST /referencia_fipes
  def create
    @referencia_fipe = ReferenciaFipe.new(referencia_fipe_params)

    if @referencia_fipe.save
      redirect_to @referencia_fipe, notice: "Referencia fipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /referencia_fipes/1
  def update
    if @referencia_fipe.update(referencia_fipe_params)
      redirect_to @referencia_fipe, notice: "Referencia fipe was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /referencia_fipes/1
  def destroy
    @referencia_fipe.destroy!
    redirect_to referencia_fipes_path, notice: "Referencia fipe was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia_fipe
      @referencia_fipe = ReferenciaFipe.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def referencia_fipe_params
      params.expect(referencia_fipe: [ :codigo, :mes ])
    end
end
