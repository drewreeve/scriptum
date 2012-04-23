Scriptum
========

Scriptum is an extremely unexciting blog/tumblelog app that I started purely as an excuse to play with rspec and mongodb.

### Getting started

1. First make sure you have ruby 1.9.2+ and mongodb installed
2. Run `bundle install`
3. Rename or copy the `settings.default.yml` file in the config folder to `settings.yml` and edit as needed
4. Create the first user with `bundle exec rake users:add`
5. Run `rackup` and go to <http://localhost:9292/admin> to login

License (MIT)
-------------

Copyright 2012 Andrew Reeve 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
