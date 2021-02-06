class TeachersController < ApplicationController
    def index
        @teacher = Teacher.all
    end
    
end
