namespace :dados do
  desc "Carrega dados de produtos nas tabelas"
  task seed: :environment do
    puts "Gerando as corretoras..."
      Corretora.create!(nome_corretora: "RICO", taxa_titulo: 0.0, taxa_TD: 0.001, taxa_fixa: 0)
      Corretora.create!(nome_corretora: "ÓRAMA", taxa_titulo: 0.0, taxa_TD: 0.0, taxa_fixa: 0)
      Corretora.create!(nome_corretora: "XP", taxa_titulo: 0.0, taxa_TD: 0.0, taxa_fixa: 0)
      Corretora.create!(nome_corretora: "EASYINVEST", taxa_titulo: 0.0, taxa_TD: 0.0, taxa_fixa: 0)
      
    puts "Gerando as tipos de produtos..."
      TipoProduto.create!(nome_produto: "CDB")
      TipoProduto.create!(nome_produto: "LC")
      TipoProduto.create!(nome_produto: "LCI")
      TipoProduto.create!(nome_produto: "LCA")
      TipoProduto.create!(nome_produto: "NTNB")
      TipoProduto.create!(nome_produto: "LTN")
      TipoProduto.create!(nome_produto: "NTNF")
      TipoProduto.create!(nome_produto: "LFT")
      
    puts "Gerando impostos..."
      Imposto.create!(tipo_produto_id: 1, prazo_min: 0, prazo_max: 180, taxa_imposto: 0.225, taxa_custodia: 0)
      Imposto.create!(tipo_produto_id: 1, prazo_min: 181, prazo_max: 360, taxa_imposto: 0.2, taxa_custodia: 0)
      Imposto.create!(tipo_produto_id: 1, prazo_min: 361, prazo_max: 720, taxa_imposto: 0.175, taxa_custodia: 0)
      Imposto.create!(tipo_produto_id: 1, prazo_min: 721, prazo_max: 999999, taxa_imposto: 0.15, taxa_custodia: 0)
      Imposto.create!(tipo_produto_id: 2, prazo_min: 0, prazo_max: 180, taxa_imposto: 0.225, taxa_custodia: 0.000)
      Imposto.create!(tipo_produto_id: 2, prazo_min: 181, prazo_max: 360, taxa_imposto: 0.2, taxa_custodia: 0.000)
      Imposto.create!(tipo_produto_id: 2, prazo_min: 361, prazo_max: 720, taxa_imposto: 0.175, taxa_custodia: 0.000)
      Imposto.create!(tipo_produto_id: 2, prazo_min: 721, prazo_max: 999999, taxa_imposto: 0.15, taxa_custodia: 0.000)
      Imposto.create!(tipo_produto_id: 3, prazo_min: 0, prazo_max: 999999, taxa_imposto: 0, taxa_custodia: 0)
      Imposto.create!(tipo_produto_id: 4, prazo_min: 0, prazo_max: 999999, taxa_imposto: 0, taxa_custodia: 0)
      Imposto.create!(tipo_produto_id: 5, prazo_min: 0, prazo_max: 180, taxa_imposto: 0.225, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 5, prazo_min: 181, prazo_max: 360, taxa_imposto: 0.2, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 5, prazo_min: 361, prazo_max: 720, taxa_imposto: 0.175, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 5, prazo_min: 721, prazo_max: 999999, taxa_imposto: 0.15, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 6, prazo_min: 0, prazo_max: 180, taxa_imposto: 0.225, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 6, prazo_min: 181, prazo_max: 360, taxa_imposto: 0.2, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 6, prazo_min: 361, prazo_max: 720, taxa_imposto: 0.175, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 6, prazo_min: 721, prazo_max: 999999, taxa_imposto: 0.15, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 7, prazo_min: 0, prazo_max: 180, taxa_imposto: 0.225, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 7, prazo_min: 181, prazo_max: 360, taxa_imposto: 0.2, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 7, prazo_min: 361, prazo_max: 720, taxa_imposto: 0.175, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 7, prazo_min: 721, prazo_max: 999999, taxa_imposto: 0.15, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 8, prazo_min: 0, prazo_max: 180, taxa_imposto: 0.225, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 8, prazo_min: 181, prazo_max: 360, taxa_imposto: 0.2, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 8, prazo_min: 361, prazo_max: 720, taxa_imposto: 0.175, taxa_custodia: 0.003)
      Imposto.create!(tipo_produto_id: 8, prazo_min: 721, prazo_max: 999999, taxa_imposto: 0.15, taxa_custodia: 0.003)
      
    puts "Gerando indexadors..."
      Indexador.create!(nome_indexador: "CDI")
      Indexador.create!(nome_indexador: "SELIC")
      Indexador.create!(nome_indexador: "IPCA")
      Indexador.create!(nome_indexador: "PRE")
 
    puts "Gerando forecasts..."
      ForecastIndexador.create!(indexador_id: 1, prazo_min: 0, prazo_max: 360, taxa_indexador: 0.0947)
      ForecastIndexador.create!(indexador_id: 1, prazo_min: 361, prazo_max: 999999, taxa_indexador: 0.0897)    
      ForecastIndexador.create!(indexador_id: 2, prazo_min: 0, prazo_max: 360, taxa_indexador: 0.1148)
      ForecastIndexador.create!(indexador_id: 2, prazo_min: 361, prazo_max: 999999, taxa_indexador: 0.1046)
      ForecastIndexador.create!(indexador_id: 3, prazo_min: 0, prazo_max: 360, taxa_indexador: 0.0483)
      ForecastIndexador.create!(indexador_id: 3, prazo_min: 361, prazo_max: 999999, taxa_indexador: 0.0483)
      ForecastIndexador.create!(indexador_id: 4, prazo_min: 0, prazo_max: 999999, taxa_indexador: 0.00)
    
      
    puts "Gerando taxas de inflação..."
      InflacaoTaxa.create!(prazo_min: 0, prazo_max: 360, taxa_inflacao: 0.08)
      InflacaoTaxa.create!(prazo_min: 361, prazo_max: 99999, taxa_inflacao: 0.07)
    
#    puts "Gerando os produtos..."
    
#      options = {:col_sep => ";"}
#      produtos = SmarterCSV.process('produtos.CSV', options)
      
#      a = 0      
#      produtos.each do |i|
#        Produto.create!(
#          corretora_id: i[:corretora],
#          tipo_produto_id: i[:produto],
#          banco: i[:banco],
#          liquidez: i[:liquidez],
#          prazo: i[:prazo],
#          indexador_id: i[:indexador],
#          rentabilidade: i[:rentabilidade],
#          valor_minimo: i[:valmin]
#          )
#          a = a + 1
#      end
      
#      puts a
    
  end
end
