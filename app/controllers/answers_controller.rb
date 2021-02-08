class AnswersController < ApplicationController

    def create
        @homework = Homework.find(params[:homework_id])
        @answer = @homework.answers.create(answer_params)
        redirect_to @homework, notice: "Successfully uploaded."   
    end

    def destroy
        @homework = Homework.find(params[:homework_id])
        @answer = @homework.answers.find(params[:id])
        @answer.destroy
        redirect_to homeworks_path, notice:  "Successfully deleted." 
      end
    
    private

    def answer_params
        params.require(:answer).permit(:name, :attachment)
    end
end
