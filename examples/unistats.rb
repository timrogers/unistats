require_relative '../lib/unistats.rb'

api = Unistats.new("<API token>")

# Check if the API details are correct and we're authenticated...
if api.authenticated?
  
  # Let's get some institutions from the API - we get them back in
  # pages of 25, and we can choose a page number with the first
  # parameter
  institutions = api.institutions
  institutions.each {|i| puts i["Name"] }
  
  # On the first page of institutions, we can see Birkbeck, Uni.
  # of London with the UKPRN ID "10007760". Let's see the courses,
  # and choose page 5 for a bit of fun.
  birkbeck_courses = api.courses("10007760", 5)
  birkbeck_courses.each {|c| puts "#{c['KisCourseId']} - #{c['Title']}"}
  
  # On that page, there's BA (Hons) Management, which has the ID
  # "UUBAMNGN_C"...let's find out some more about that one with
  # the `course` method, but only the basics...
  course = api.course("10007760", "UUBAMNGN_C", false)
  puts course['MaximumFeeForEnglandDomicile']
  
  # So, the maximum course fee is £9000 per year. Let's find out some more
  # interesting statistics as well.
  stats = api.course_statistics("10007760", "UUBAMNGN_C")
  
  # That's kinda interesting. There is plenty more information
  # about each course, but we can actually get *everything* with
  # the course method (that's statistics, stages and accreditations)
  # by leaving the third parameter blank, or setting it to true.
  course = api.course("10007760", "UUBAMNGN_C")
  puts "The course has #{course[:stages].length} stages."

else
  raise "The API authentication details were wrong, fool"
end