require 'rubygems'
require 'httparty'

class Unistats
  include HTTParty
  format :json
  
  base_uri 'data.unistats.ac.uk/api/KIS'
  
  # Initialises the Unistats class and configures authentication with an
  # access token - obtain one at http://dataportal.unistats.ac.uk/Account/Register
  # Params:
  # +access_token+:: an access token for the Unistats API
  def initialize(access_token)
    self.class.basic_auth access_token, nil
  end
  
  # Checks whether provided API authentication credentials for the Unistats
  # API are correct, returning *true* or *false*
  def authenticated?
    response = institutions
    case response.code
    when 401
      false
    else
      true
    end
  end
  
  # Returns a list of institutions registered on Unistats in pages of 25
  # entries as an object parsed from JSON
  # Params:
  # +pageIndex+:: the page number to view, starting from 0
  def institutions(pageIndex=0, options={})
    options.merge!({:query => {:pageIndex => pageIndex}})
    self.class.get("/Institutions.json", options)
  end
  
  # Returns information about a specified institution as an object parsed
  # from JSON
  # Params:
  # +institution+:: the UKPRN identifier for an institution
  def institution(institution, options={})
    self.class.get("/Institution/#{institution}.json", options)
  end
  
  # Returns information about courses at an institution as an object parsed
  # from JSON, in pages of 25 entries
  # Params:
  # +institution+:: the UKPRN identifier for an institution
  # +pageIndex+:: the page number to view, starting from 0
  def courses(institution, pageIndex=0, options={})
    options.merge!({:query => {:pageIndex => pageIndex}})
    self.class.get("/Institution/#{institution}/Courses.json", options)
  end
  
  # Returns information about a specific course at an institution as an object
  # parsed from JSON
  # Params:
  # +institution+:: the UKPRN identifier for an institution
  # +course+:: the KIS ID for a course, unique to a course provider (UKPRN)
  # +recursive+:: (boolean) sets whether to use the other course data methods
  # to find out more details about this course (e.g. statistics, stages)
  def course(institution, course, recursive=true, options={})
    response = self.class.get("/Institution/#{institution}/Course/#{course}.json", options)
    if recursive
      response.merge!({:accreditations => course_accreditations(institution, course)})
      response.merge!({:stages => course_stages(institution, course)})
      response.merge!({:statistics => course_statistics(institution, course)})
    end
    response
  end
  
  # Returns information on accreditations for a specific course at an
  # institution as an object parsed from JSON
  # Params:
  # +institution+:: the UKPRN identifier for an institution
  # +course+:: the KIS ID for a course, unique to a course provider (UKPRN)
  def course_accreditations(institution, course, options={})
    self.class.get("/Institution/#{institution}/Course/#{course}/Accreditation.json", options)
  end
  
  # Returns information on stages of a specific course at an
  # institution as an object parsed from JSON
  # Params:
  # +institution+:: the UKPRN identifier for an institution
  # +course+:: the KIS idea for a course, unique to a course provider (UKPRN)
  def course_stages(institution, course, options={})
    self.class.get("/Institution/#{institution}/Course/#{course}/Stages.json", options)
  end
  
  # Returns statistics aboout a specific course at an institution as an object
  # parsed from JSON
  # Params:
  # +institution+:: the UKPRN identifier for an institution
  # +course+:: the KIS idea for a course, unique to a course provider (UKPRN)
  def course_statistics(institution, course, options={})
    self.class.get("/Institution/#{institution}/Course/#{course}/Statistics.json", options)
  end
end
    
    