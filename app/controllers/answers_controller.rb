class AnswersController < ApplicationController

    def create
        @homework = Homework.find(params[:homework_id])
        @answers = @homework.answers.create(answer_params)
        redirect_to @homework
    end
    
    private

    def answer_params
        params.require(:answer).permit(:name, :attachment)
    end


end
