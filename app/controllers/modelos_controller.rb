class ModelosController < ApplicationController
  before_action :set_modelo, only: %i[ show edit update destroy ]

  # GET /modelos
  def index
    @modelos = Modelo.all
  end

  # GET /modelos/1
  def show
  end

  # GET /modelos/new
  def new
    @modelo = Modelo.new
  end

  # GET /modelos/1/edit
  def edit
  end

  # POST /modelos
  def create
    @modelo = Modelo.new(modelo_params)

    if @modelo.save
      redirect_to @modelo, notice: "Modelo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /modelos/1
  def update
    if @modelo.update(modelo_params)
      redirect_to @modelo, notice: "Modelo was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /modelos/1
  def destroy
    @modelo.destroy!
    redirect_to modelos_path, notice: "Modelo was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def modelo_params
      params.expect(modelo: [ :marca_id, :referencia_fipe_id, :codigo, :nome ])
    end
end
