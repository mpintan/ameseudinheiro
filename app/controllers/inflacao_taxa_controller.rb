class InflacaoTaxaController < ApplicationController
  before_action :set_inflacao_taxa, only: [:show, :edit, :update, :destroy]
  
  def index
    @inflacao_taxa = InflacaoTaxa.all
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @inflacao_taxa.update(inflacao_taxa_params)
        format.html { redirect_to action: "index", notice: 'Taxa Atualizada' }
        format.json { render :show, status: :ok, location: @inflacao_taxa }
      else
        format.html { render :edit }
        format.json { render json: @inflacao_taxa.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inflacao_taxa
      @inflacao_taxa = InflacaoTaxa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inflacao_taxa_params
      params.require(:inflacao_taxa).permit(:prazo_min, :prazo_max, :taxa_inflacao)
    end
  
end
