class PrecoVeiculosController < ApplicationController
  before_action :set_preco_veiculo, only: %i[ show edit update destroy ]

  # GET /preco_veiculos
  def index
    @preco_veiculos = PrecoVeiculo.all
  end

  # GET /preco_veiculos/1
  def show
  end

  # GET /preco_veiculos/new
  def new
    @preco_veiculo = PrecoVeiculo.new
  end

  # GET /preco_veiculos/1/edit
  def edit
  end

  # POST /preco_veiculos
  def create
    @preco_veiculo = PrecoVeiculo.new(preco_veiculo_params)

    if @preco_veiculo.save
      redirect_to @preco_veiculo, notice: "Preco veiculo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /preco_veiculos/1
  def update
    if @preco_veiculo.update(preco_veiculo_params)
      redirect_to @preco_veiculo, notice: "Preco veiculo was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /preco_veiculos/1
  def destroy
    @preco_veiculo.destroy!
    redirect_to preco_veiculos_path, notice: "Preco veiculo was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preco_veiculo
      @preco_veiculo = PrecoVeiculo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def preco_veiculo_params
      params.expect(preco_veiculo: [ :ano_modelo_id, :referencia_fipe_id, :codigo_fipe, :ano_modelo_valor_centavos, :moeda, :mes_referencia, :tipo_veiculo, :bruto, :atualizado_em ])
    end
end
