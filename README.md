# README

## Operations
Basic usage of trailblazer-operations is shown in for Event CRUD actions.

See `app/concepts/event/operation/` and `app/concepts/note/operation/` files for examples, with respective controllers for usage.

Macro::Find (from trailblazer-macro gem) is used in event operations.

Models are not using validations, this responsibility is delegated to the custom from object.

## Testing

`$ sudo -u postgres createuser remeet_development -s -P`

`bundle exec rails test`

## Trailblazer debugging

In order to use trailblazer tracing/debugging, you need to:
Change operation invocation method from #call to #wtf? in controller actions.
  `result = Event::Operation::Show.call(params: params)` -> `result = Event::Operation::Show.wtf?(params: params)`

For more information please see https://trailblazer.to/2.1/docs/trailblazer/#trailblazer-developer

## Trailblazer PRO debugging

In order to use trailblazer-pro **web** tracing/debugging, you need to:

1. Uncomment `gem 'trailblazer-pro-rails'` in the Gemfile.
2. Get your API key from https://pro.trailblazer.to/settings
3. Run `rails g trailblazer:pro:install` and paste your API key.
4. Change operation invocation method from #call to #WTF? in controller actions.
  `result = Event::Operation::Show.call(params: params)` -> `result = Event::Operation::Show.WTF?(params: params)`

For more information please see https://trailblazer.to/2.1/docs/pro/