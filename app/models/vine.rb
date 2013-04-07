require 'nokogiri'
require 'open-uri'

class Vine < ActiveRecord::Base
  attr_accessible :uri, :vineid
  
  
  def self.proxy(vineid)
    @vineuri = "https://vine.co/v/" + vineid
    
    # scrape this vine's page and get the video uri
    @vinevideo = Nokogiri::HTML(open(@vineuri))
    @vinevideo = @vinevideo.at('meta[@property="twitter:player:stream"]')[:content]
    
    if @vinevideo.match(/mp4/i)
      # vinevideo has video, so return it
      @vinevideo
    else
      # vinevideo doesn't have video, so show default cat video
      "https://vines.s3.amazonaws.com/videos/2013/04/06/B15F7BDE-74A4-4D43-B81A-8E2AF2A5B1AC-305-000000935BA4A4CB_1.0.7.mp4?versionId=bCRp4zWMDa_VqxSl3ykWa0c5oERUxRih"
    end
  end
end
