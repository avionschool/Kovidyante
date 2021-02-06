class AttendancesController < ApplicationController

    before_action :authenticate_user!
  
    def index

      require "uri"
      require "net/http"
  
      url = URI("https://rest-api-lj.herokuapp.com/post")
  
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
  
      request = Net::HTTP::Get.new(url)
      request["Content-Type"] = "application/json"
     
      response = https.request(request)
      puts response.read_body
      result = JSON.parse(response.read_body)
      
      if result === []
          puts "no result"
      else
    
          puts result[0]['title']
          student_id = result[0]['title']
          api_id = result[0]['_id']
    
      url = URI("https://rest-api-lj.herokuapp.com/post/#{api_id}")
      
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      
      request = Net::HTTP::Delete.new(url)
      request["Content-Type"] = "application/json"
      
      response = https.request(request)
      puts response.read_body
      puts 'deleted'
          # byebug
     
      end

      present = Attendance.create(status: true, student_id:  student_id.to_i, student_name: current_user.name)
      
      end

      private

      def attendance_params
        params.require(:attendance).permit(:status, :student_id, :student_name)
      end
  
  end