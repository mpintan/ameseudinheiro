class Produto < ActiveRecord::Base
  belongs_to :corretora
  belongs_to :tipo_produto
  belongs_to :indexador
  
  def self.importcsv(file)

      puts "Gerando os produtos..."
    
      options = {:col_sep => ";"}
      produtos = SmarterCSV.process(file.path, options)
      
      a = 0      
      produtos.each do |i|
        Produto.create!(
          corretora_id: i[:corretora],
          tipo_produto_id: i[:produto],
          banco: i[:banco],
          liquidez: i[:liquidez],
          prazo: i[:prazo],
          indexador_id: i[:indexador],
          rentabilidade: i[:rentabilidade],
          valor_minimo: i[:valmin]
          )
          a = a + 1
      end
      
      puts a

  end
  
end
