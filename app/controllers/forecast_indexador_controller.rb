class ForecastIndexadorController < ApplicationController
  before_action :set_forecast_indexador, only: [:show, :edit, :update, :destroy]
  
  def index
    @forecast_indexador = ForecastIndexador.all
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @forecast_indexador.update(forecast_indexador_params)
        format.html { redirect_to action: "index", notice: 'Taxa Atualizada' }
        format.json { render :show, status: :ok, location: @forecast_indexador }
      else
        format.html { render :edit }
        format.json { render json: @forecast_indexador.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast_indexador
      @forecast_indexador = ForecastIndexador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_indexador_params
      params.require(:forecast_indexador).permit(:prazo_min, :prazo_max, :taxa_indexador)
    end
  
end
