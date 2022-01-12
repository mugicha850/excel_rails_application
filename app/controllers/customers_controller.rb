class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    respond_to do |format|
      format.html
      format.xlsx do
        # ファイル名をここで指定する（動的にファイル名を変更できる）
        response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
      end
    end
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else 
      render 'new'
    end
  end

  def edit
    @customer =Customer.find(params[:id])
  end

  def update
    @customer =Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path
    else 
      render 'edit'
    end
  end

  def ringo
    respond_to do |format|
      format.html
    end
  end

  private
  def customer_params
    params[:customer].permit(:name, :number)
  end

end
