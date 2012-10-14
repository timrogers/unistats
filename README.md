# Unistats

This is a very simple API library for the Higher Education Funding Council for England (HEFCE) Unistats API, which provides a range of information about higher education institutions and courses in the United Kingdom.

Unistats provides information via the API which this uses, as well as in downloadable XML form. You can find out more about the data [here](http://www.unistats.com/open-access-data/).

*I should be tested, but I'm not.* However, this is so simple and my skills so lacking that I can't be bothered to do it.

### Getting an API key

You can sign up for an API key for the API instantly from the Unistats website. All you have to provide is an email address and password and you'll get an API key which you can pass into this right away. To sign up, click [here](http://www.unistats.com/open-access-data/).

### Using the library

First, you'll need to install the library. You can do this from the command line:

```bash
gem install unistats
```

Alternatively, you can let Bundler handle things for you using your Gemfile...

```bash
echo "gem 'unistats'" >> Gemfile
bundle install
```

It's then very easy to use indeed. All you need to do is require the Gem into your script (usually), initialize an instance of Unistats class, passing in your API key to the constructor and then play to your heart's content:

```ruby
require 'unistats'

api = Unistats.new("<an API key>")
api.institutions # Get the first 25 institutions alphabetically from the API
```

If you'd like a bit more information on how things work, check out examples/unistats.rb.

### Documentation

There's not that much need for it, but you can view full documentation on all the methods in the library in the RDoc documentation hosted on GitHub [here](http://timrogers.github.com/unistats). If you'd like, you can generate this yourself by running `rdoc`.

#### Acknowledgements

This very simple and easily improvable gem was created by [Tim Rogers](http://www.tim-rogers.co.uk) in a couple of hours on 14th October 2012. It is released under the MIT License - see the LICENSE file for more information.



