class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    render :index
  end

  def new
    @division = Division.find(params[:division_id])
    @employee  = Employee.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to divison_path(@division)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    render :edit
  end

  def show
    @employee = Employee.find(params[:id])
    render :show
  end

  def update
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to divison_path(@division)
    else
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to divison_path(@division)
  end

  private
    def employee_params
      params.require(:employee).permit(:name)
    end
end
