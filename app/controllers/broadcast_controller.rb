class BroadcastController < ApplicationController

  require 'net/http'

  def home
    # youtube_url = 'http://www.googleapis.com/youtube/v3/channels?part=id&mine=true'
    #
    # uri = URI(youtube_url)
    # req = Net::HTTP::Get.new(uri)
    # req['Authorization'] = (' Bearer AIzaSyDYt7dcp7yBdKyLA1NOuArEyFd_VeLeqew')
    # res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    #   http.request(req)
    # }
    #
    # #
    # # Net::HTTP.start(uri.host, uri.port,
    # #                 :use_ssl => uri.scheme == 'https') do |http|
    #   # req.add_field('Authorization', ' Bearer AIzaSyDYt7dcp7yBdKyLA1NOuArEyFd_VeLeqew')
    #   # req['Authorization'] = (' Bearer AIzaSyDYt7dcp7yBdKyLA1NOuArEyFd_VeLeqew')
    #   # req = Net::HTTP::Get.new uri
    #
    #   # response = http.req req # Net::HTTPResponse object
    # # end
    # debugger
  end

  def home2

  end
end
