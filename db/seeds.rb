# db/seeds.rb (exemplo mínimo)
ref = ReferenciaFipe.first || ReferenciaFipe.create!(codigo: 999, mes: "Teste/2025")
Marca.create!(referencia_fipe: ref, codigo: "001", nome: "Fiat", tipo_veiculo: :carros)
