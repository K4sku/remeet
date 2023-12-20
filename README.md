# README

## Operations
Basic usage of trailblazer-operations is shown in for Event CRUD actions.

See `app/concepts/event/operation/` files for example, and `app/controllers/events_controller.rb` for usage.

Note: trailblazer-macro is not used in these operations. 
Event model is not using validations, this responsibility is delegated to the custom from object.

## Testing

1. The file structure of our test suite, particularly `test/concepts` is not final, yet.

sudo -u postgres createuser remeet_development -s -P
