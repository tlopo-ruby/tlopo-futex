# TLOPO-Futex

**tlopo-futex** is a Ruby gem providing a simple interface for file-based locking. It enables mutual exclusion between processes to ensure safe access to shared resources.

## Features

- File-based locking mechanism
- `lock`, `release`, and `synchronize` methods for efficient, non-blocking resource handling
- Lightweight and reliable

## Installation

Add this line to your Gemfile:

```ruby
gem 'tlopo-futex'
```

Then run:

```bash
bundle install
```

Or install directly with:

```bash
gem install tlopo-futex
```

## Usage

### Basic Lock and Unlock Example

```ruby
require 'tlopo/futex'

# Initialize the lock with a path to a lock file
lock = Tlopo::Futex.new('/tmp/my_lock_file')

# Lock, execute critical code, then release
lock.lock
# Critical section code goes here
lock.release
```

### Checking Lock Status

You can check if the lock is currently active:

```ruby
if lock.locked?
  puts "Resource is locked by another process"
else
  lock.lock
  # Critical section code
  lock.release
end
```

### Using `synchronize` for Automatic Locking

The `synchronize` method locks and releases automatically, ensuring that the lock is properly released even if an error occurs.

```ruby
lock.synchronize do
  # Critical section code that needs exclusive access
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/tlopo-ruby/tlopo-futex](https://github.com/tlopo-ruby/tlopo-futex).

## License

This gem is available under the MIT License.
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tlopo-ruby/tlopo-futex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tlopo-ruby/tlopo-futex/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tlopo::Futex project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tlopo-futex/blob/main/CODE_OF_CONDUCT.md).
