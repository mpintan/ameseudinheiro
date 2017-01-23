class InfoController < ApplicationController
  def index
    
    @inflacao = InflacaoTaxa.all

  end
  
  def import
    
    #importar os dados do arquivo csv
    Produto.delete_all
    Produto.importcsv(params[:file])
    @message = "Arquivo importado com sucesso!"
    @notify_flag = "success"
    redirect_to "/info/index", notice: "Produtos Importados com sucesso!"
    
  end
  
  
end
