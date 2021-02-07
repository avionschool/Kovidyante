class HomeworksController < ApplicationController
  def index
    @homeworks = Homework.all
  end

  def new
    @homework = Homework.new
  end

  def show
    @homework = Homework.find(params[:id])
  end

  def create   
    @homework = Homework.new(resume_params)   
       
    if @homework.save   
       redirect_to homeworks_path, notice: "Successfully uploaded."   
    else   
       render "new"   
    end        
  end   

  def destroy
    @homework = Homework.find(params[:id])   
    @homework.destroy   
    redirect_to homeworks_path, notice:  "Successfully deleted." 
  end

  private   
  def resume_params   
    params.require(:homework).permit(:name, :attachment)   
  end   


end
