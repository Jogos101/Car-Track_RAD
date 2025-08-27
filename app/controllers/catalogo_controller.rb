class CatalogoController < ApplicationController
  # /marcas/:marca_codigo/modelos
  def modelos_por_marca
    key = params[:marca_codigo].to_s
    marca = Marca.find_by(codigo: key) || Marca.find_by(id: key)
    return render json: [] unless marca

    modelos = Modelo.where(marca_id: marca.id).select(:codigo, :nome).order(:nome)
    render json: modelos
  end

  # /modelos/:modelo_codigo/anos  (retorna [2018,2019,...])
  def anos_do_modelo
    key = params[:modelo_codigo].to_s
    modelo = Modelo.find_by(codigo: key) || Modelo.find_by(id: key)
    return render json: [] unless modelo

    anos = AnoModelo.where(modelo_id: modelo.id)
                    .where.not(ano: nil)
                    .distinct
                    .order(:ano)
                    .pluck(:ano)
    render json: anos
  end

  # /veiculos_modelo/:modelo_codigo  (séries ano x preço)
  def veiculos_por_modelo
    key = params[:modelo_codigo].to_s
    modelo = Modelo.find_by(codigo: key) || Modelo.find_by(id: key)
    return render json: [] unless modelo

    ref_id = ReferenciaFipe.order(codigo: :desc).limit(1).pick(:id)

    rows = PrecoVeiculo
             .joins(:ano_modelo)
             .where(ano_modelos: { modelo_id: modelo.id })
             .yield_self { |rel| ref_id ? rel.where(referencia_fipe_id: ref_id) : rel }
             .select(
               "preco_veiculos.codigo_fipe AS codigo_fipe",
               "ano_modelos.nome AS nome_ano",
               "ano_modelos.ano AS ano",
               "ano_modelos.combustivel AS combustivel",
               "preco_veiculos.ano_modelo_valor_centavos AS valor_centavos"
             ).order("ano_modelos.ano ASC NULLS LAST")

    data = rows.map do |r|
      {
        codigoFipe:  r.codigo_fipe,
        modelo:      { nome: modelo.nome },
        ano:         r.ano,
        valor:       (r.valor_centavos || 0) / 100.0,
        combustivel: r.combustivel
      }
    end

    render json: data
  end
end
