class MarcasController < ApplicationController
  before_action :set_marca, only: %i[ show edit update destroy ]

  # GET /marcas
  def index
     # Somente marcas com ao menos 1 modelo
    @marcas = Marca.joins(:modelos).distinct.order(:nome)

    # Contagem de modelos por marca (para a tabela)
    @qtd_veiculos = Modelo.group(:marca_id).count

    # Média por marca (só onde existir preço) – tudo em uma query
    pares = PrecoVeiculo
      .joins(ano_modelo: { modelo: :marca })
      .group('marcas.id', 'marcas.nome')
      .pluck('marcas.nome', 'AVG(preco_veiculos.ano_modelo_valor_centavos)')

    # Constrói arrays para o gráfico já em reais
    @labels = []
    @values = []
    pares.each do |nome, media_centavos|
      next if media_centavos.nil?
      @labels << nome
      @values << (media_centavos.to_i / 100.0)
    end
  end


  # GET /marcas/1
  def show
  end

  # GET /marcas/new
  def new
    @marca = Marca.new
  end

  # GET /marcas/1/edit
  def edit
  end

  # POST /marcas
  def create
    @marca = Marca.new(marca_params)

    if @marca.save
      redirect_to @marca, notice: "Marca was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /marcas/1
  def update
    if @marca.update(marca_params)
      redirect_to @marca, notice: "Marca was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /marcas/1
  def destroy
    @marca.destroy!
    redirect_to marcas_path, notice: "Marca was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca
      @marca = Marca.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def marca_params
      params.expect(marca: [ :referencia_fipe_id, :codigo, :nome, :tipo_veiculo ])
    end
end
