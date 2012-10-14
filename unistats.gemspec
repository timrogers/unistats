Gem::Specification.new do |s|
  s.name        = 'unistats'
  s.version     = '1.0.0'
  s.date        = '2012-10-14'
  s.summary     = "An API library for UK higher education data"
  s.description = "An API for accessing the Unistats API, which provides data from the Higher Education Funding Council for England on further education."
  s.authors     = ["Tim Rogers"]
  s.email       = 'tim@tim-rogers.co.uk'
  s.files       = ["lib/unistats.rb"]
  s.homepage    =
    'https://github.com/timrogers/unistats'
  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'json'
end