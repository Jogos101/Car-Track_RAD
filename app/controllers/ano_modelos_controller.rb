class AnoModelosController < ApplicationController
  before_action :set_ano_modelo, only: %i[ show edit update destroy ]

  # GET /ano_modelos
  def index
    @ano_modelos = AnoModelo.all
  end

  # GET /ano_modelos/1
  def show
  end

  # GET /ano_modelos/new
  def new
    @ano_modelo = AnoModelo.new
  end

  # GET /ano_modelos/1/edit
  def edit
  end

  # POST /ano_modelos
  def create
    @ano_modelo = AnoModelo.new(ano_modelo_params)

    if @ano_modelo.save
      redirect_to @ano_modelo, notice: "Ano modelo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ano_modelos/1
  def update
    if @ano_modelo.update(ano_modelo_params)
      redirect_to @ano_modelo, notice: "Ano modelo was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ano_modelos/1
  def destroy
    @ano_modelo.destroy!
    redirect_to ano_modelos_path, notice: "Ano modelo was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ano_modelo
      @ano_modelo = AnoModelo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ano_modelo_params
      params.expect(ano_modelo: [ :modelo_id, :referencia_fipe_id, :codigo, :nome, :ano, :combustivel, :combustivel_sigla ])
    end
end
