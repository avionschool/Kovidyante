class StudentsController < ApplicationController
#     def index

#     require "uri"
#     require "net/http"

#     url = URI("https://rest-api-lj.herokuapp.com/post")

#     https = Net::HTTP.new(url.host, url.port)
#     https.use_ssl = true

#     request = Net::HTTP::Get.new(url)
#     request["Content-Type"] = "application/json"
   
#     response = https.request(request)
#     puts response.read_body
#     result = JSON.parse(response.read_body)
    
#     if result === []
#         puts "no result"
#     else
  
#         puts result[0]['title']
#         student_id = result[0]['title']
#         api_id = result[0]['_id']

#     url = URI("https://rest-api-lj.herokuapp.com/post/#{api_id}")
    
#     https = Net::HTTP.new(url.host, url.port)
#     https.use_ssl = true
    
#     request = Net::HTTP::Delete.new(url)
#     request["Content-Type"] = "application/json"
    
#     response = https.request(request)
#     puts response.read_body
#     puts 'deleted'
#         # byebug
   
#     end
  
#   private
#   def attendance_params
#     params.permit(:status, :student_id)
#   end
 
#     end
end
