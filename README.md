# OmniAuth Bitbucket

This is the OmniAuth strategy for authenticating to [Bitbucket](https://bitbucket.org). 
To use it, you'll need to signup and create a new application or use your 
existing OAuth consumer and secret keys.

At a minimum, your BitBucket OAuth scopes must be set to `email,repository` for the OAuth flow to complete.

## Install

Add dependency to your Gemfile:

```
gem 'omniauth-bitbucket'
```

Or install manually:

```
gem install omniauth-bitbucket
```

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :bitbucket, ENV['BITBUCKET_KEY'], ENV['BITBUCKET_SECRET']
end
```

If using Rails, add an initializer `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bitbucket, 'BITBUCKET_KEY', 'BITBUCKET_SECRET'
end
```

## License

Copyright (c) 2011-2013 Dingding Ye.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
