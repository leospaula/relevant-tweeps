**Requirements**
---
ruby 2.3.3

**Instructions**
---
1. create your env file `cp .env.sample .env`
2. set `HTTP_USERNAME`
3. give app permission to run `chmod +x bin/relevant-tweeps`
4. you're all set, be happy and run `./bin/relevant-tweeps`

additional instructions for devs:
1. make sure you have bundler installed [http://bundler.io/](http://bundler.io/ "http://bundler.io/")
2. install dependencies `bundle install`
3. and run tests `rspec`

**Usage**
---
To get most relevants tweets:
`$ curl -v -X GET http://localhost:3000/most_relevants`

To get tweets grouped by users with most mentions:
`$ curl -v -X GET http://localhost:3000/most_mentions`

**Additional info**
---
This app was made with ruby standard library only, besides two external libraries used only for development and test environments: pry and rspec.
- [pry](https://github.com/pry/pry "pry") is an IRB alternative and runtime developer console very usefull, especially for debug
- [rspec](https://github.com/rspec/rspec "rspec") is a library to write tests in ruby that I choose based on my personal preferences and I find more elegant the way rspec deals with mocks and stubs.
