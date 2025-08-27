class ComparadorController < ApplicationController
  def index
    # marcas com pelo menos 1 modelo
    @marcas = Marca.joins(:modelos).distinct.order(:nome)

    @veiculo1 = montar_veiculo(params[:marca1], params[:codigoModelo], params[:codigoAno])
    @veiculo2 = montar_veiculo(params[:marca2], params[:codigoModelo], params[:codigoAno]) if params[:card] == "2"

    # Alternativamente, aceite params diferentes para o 2º card:
    @veiculo2 ||= montar_veiculo(params[:marca2], params[:codigoModelo2], params[:codigoAno2])

    @condiction1 = @veiculo1.present?
    @condiction2 = @veiculo2.present?
  end

  private

  def montar_veiculo(marca_codigo, modelo_codigo, ano)
    return nil if [modelo_codigo, ano].any?(&:blank?)

    modelo = Modelo.find_by(codigo: modelo_codigo) || Modelo.find_by(id: modelo_codigo)
    return nil unless modelo

    marca = if marca_codigo.present?
              Marca.find_by(codigo: marca_codigo) || Marca.find_by(id: marca_codigo)
            else
              modelo.marca
            end
    return nil unless marca && modelo.marca_id == marca.id

    ano_rec = AnoModelo.where(modelo_id: modelo.id, ano: ano.to_i).first
    return nil unless ano_rec

    ref_id = ReferenciaFipe.order(codigo: :desc).limit(1).pick(:id)
    preco  = PrecoVeiculo.where(ano_modelo_id: ano_rec.id)
                        .yield_self { |r| ref_id ? r.where(referencia_fipe_id: ref_id) : r }
                        .order(updated_at: :desc).first
    return nil unless preco

    {
      modelo_codigo: modelo.codigo,
      modelo_nome:   "#{marca.nome} - #{modelo.nome}",
      ano:           ano_rec.ano,
      combustivel:   ano_rec.combustivel,
      valor:         (preco.ano_modelo_valor_centavos || 0) / 100.0
    }
  end
end
