class PedidosController < SiteController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :verify_comprador, only: [:edit, :update, :destroy]
 
  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @comprador = Comprador.find(JSON.parse(cookies[:comprador_login])["id"])
    @ingresso = Ingresso.find(params[:ingresso])
    @imagem = params[:imagem]
  end

  # GET /pedidos/1/edit
  def edit
    @comprador = Comprador.find(JSON.parse(cookies[:comprador_login])["id"])
    @ingresso = Ingresso.find(params[:ingresso])
    @imagem = params[:imagem]
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to root_path, notice: @pedido.pago ? "Compra realizada com sucesso" : "Solicitação realizada com sucesso" }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to comprador_path(@pedido.comprador), notice: 'Pedido atualizado com sucesso' }
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
      format.html { redirect_to comprador_path(@pedido.comprador) , notice: 'Pedido Cancelado' }
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
      params[:pedido][:pago] = true if params[:commit] == "Comprar"
      params.require(:pedido).permit(:comprador_id, :ingresso_id, :pago)
    end

    def verify_comprador
      if @pedido.comprador.id == JSON.parse(cookies[:comprador_login])["id"]
        true
      else
        false
        flash[:error] = "Você não tem permissão para acessar esse conteúdo"
        redirect_to root_path
      end
    end
end
