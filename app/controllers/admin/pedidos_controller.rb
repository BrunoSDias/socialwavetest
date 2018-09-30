class Admin::PedidosController < AdminController
    before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end
  
  # GET /pedidos/1/edit
  def edit
  end
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to admin_pedido_path(@pedido), notice: 'Pedido foi atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to admin_pedidos_path, notice: 'Pedido foi removido com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:comprador_id, :ingresso_id, :pago)
    end
end
