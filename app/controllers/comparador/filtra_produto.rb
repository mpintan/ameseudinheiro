# Monta hash com os títulos selecionados
class Titulos

    def initialize
        $titulos = []
    end

    def adiciona(titulo)
        $titulos << titulo
    end

end

# Define as variávels dos títulos para o buscador
class Titulo
    attr_accessor :id
    attr_accessor :corretora
    attr_accessor :produto
    attr_accessor :banco
    attr_accessor :prazo
    attr_accessor :liquidez
    attr_accessor :valormin
    attr_accessor :rentabilidade
    attr_accessor :nomeindexador
    attr_accessor :imposto
    attr_accessor :custodia
    attr_accessor :txadm
    attr_accessor :txindexador
    attr_accessor :inflacao
    attr_accessor :rentaliq
    attr_accessor :rendimentoliq
    attr_accessor :dataupdate
end

# Seleciona títulos e realiza cálculos de rentabilidade
def lista_produtos(valor_apl, data_resg)
    
    #Calcula o prazo de entrada em dias
    prazodias = Integer(Date.parse(data_resg) - Date.parse(Time.now.to_s))

    # Seleciona os produtos que correspondem a seleção
    @produtos = Produto.where(["(prazo <= #{prazodias} and valor_minimo <= #{valor_apl}) or (liquidez = 'S' and (indexador_id = 1 or indexador_id = 2) and valor_minimo <= #{valor_apl})"])

    # Seleciona aliquota de impostos
    @impostos = Imposto.where(["prazo_min < #{prazodias} and prazo_max > #{prazodias}"])

    # Seleciona taxa de inflação
    @inflacao = InflacaoTaxa.where(["prazo_min < #{prazodias} and prazo_max > #{prazodias}"])
    
    # Seleciona indexadores
    @indexadores = ForecastIndexador.where(["prazo_min < #{prazodias} and prazo_max > #{prazodias}"])
    
    # Monta lista com produtos
    titulos = Titulos.new
    a = 0
    @produtos.each do |pr|
        titulo = Titulo.new
        a = a + 1
        titulo.id = a
        titulo.corretora = pr.corretora.nome_corretora
        titulo.produto = pr.tipo_produto.nome_produto
        titulo.banco = pr.banco
        titulo.prazo = pr.prazo
        titulo.valormin = pr.valor_minimo
        titulo.dataupdate = pr.updated_at
        if pr.indexador_id == 1 or pr.indexador_id == 2
            titulo.rentabilidade = String(pr.rentabilidade / 100) + '% ' + pr.indexador.nome_indexador
        elsif pr.indexador_id == 3
            titulo.rentabilidade = pr.indexador.nome_indexador + ' +' + String(pr.rentabilidade / 100) + "%"
        else
            titulo.rentabilidade = String(pr.rentabilidade / 100) + "%"
        end
        titulo.nomeindexador = pr.indexador.nome_indexador
        titulo.txadm = pr.corretora.taxa_TD
        vliquidez = String(pr.liquidez)
        if vliquidez == "S"
            titulo.liquidez = 'Sim'
        else
            titulo.liquidez = 'Não'
        end
        # Pega aliquota de imposto
        @impostos.each do |imp|
            if imp.tipo_produto == pr.tipo_produto
                titulo.imposto = imp.taxa_imposto
                titulo.custodia = imp.taxa_custodia
            end
        end
        # Pega indexador
        @indexadores.each do |ind|
            if ind.indexador == pr.indexador
               titulo.txindexador = ind.taxa_indexador
            end
        end
        # Pega taxa de inflação
        @inflacao.each do |inf|
            titulo.inflacao = inf.taxa_inflacao
        end
    # calcula rentabilidade
        # calcula rentabilidade anual liquida
            # Rentabilidade Liquida
                # rentabilidade para titulo indexado
                if pr.indexador_id == 1 or pr.indexador_id == 2
                    titulo.rentaliq = ((pr.rentabilidade / 10000.0) * (titulo.txindexador)) * (1 - titulo.imposto)
                    puts titulo.banco
                    puts 'rentabilidade = ' + String(pr.rentabilidade / 10000.0)
                    puts 'indexador = ' + String(1.0 + titulo.txindexador)
                    puts 'imposto = ' + String(1 - titulo.imposto)
                # rentabilidade para titulo IPCA
                elsif pr.indexador_id == 3
                    titulo.rentaliq = ((1+(pr.rentabilidade / 10000.0)) * (1.0 + titulo.inflacao) - 1) * (1 - titulo.imposto)
                # rentabilidade PRE
                else
                    titulo.rentaliq = (pr.rentabilidade / 10000.0) * (1 - titulo.imposto)
                end
                # Rentabilidade liquida de taxas
                if pr.tipo_produto_id = 5 or pr.tipo_produto_id = 6 or pr.tipo_produto_id = 7 or pr.tipo_produto_id = 8
                    titulo.rentaliq = titulo.rentaliq - pr.corretora.taxa_TD - titulo.custodia
                else
                    titulo.rentaliq = titulo.rentaliq - pr.corretora.taxa_titulo
                end
        # calcula rendimentos liquidos
        prazominimo = [prazodias, titulo.prazo].min
        titulo.rendimentoliq = (valor_apl.to_f * ((1 + titulo.rentaliq)**(prazominimo/365.0)))-valor_apl.to_f
        # adiciona título na hash
        titulos.adiciona titulo
    end
end
