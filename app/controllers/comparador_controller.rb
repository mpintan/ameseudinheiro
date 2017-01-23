class ComparadorController < ApplicationController

require 'comparador/filtra_produto.rb'

  def index
        vdt = Date.parse(Time.now.to_s) + 30
        @vdata = String(vdt.month) + "/" + String(vdt.day) + "/" + String(vdt.year)
        begin
            @valor_aplicar = params.require(:valor)
            @data_resgate = params.require(:dataresg)
        rescue
            @msgerro = 'Preencha corretamente as informações'
            @resposta = nil
        else 
            @valor_aplicar = @valor_aplicar.remove ('.')
            @valor_aplicar = String(@valor_aplicar.to_i)
            @msgerro = nil
            lista_produtos(@valor_aplicar, @data_resgate)
            @resposta = $titulos
        end     
  end
  
end
