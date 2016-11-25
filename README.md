# SettingStore

SettingStore is a simple wrapper around PStore that allows you to set persistent data using a key value store

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'setting_store'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install setting_store

## Usage

To set a new key value pair
```
SettingStore.set(:feature, value: 'Hello World')
```

To retrieve a set value
```
SettingStore.get(:feature)
=> 'Hello World'
```

To check if value of a specific key is truthy
```
SettingStore.set(:simple_key, value: 'Random String')
SettingStore.active?(:simple_key)
=> false

# must be explicitly set to true for .active? to return true
SettingStore.set(:simple_key, value: true)
SettingStore.active?(:simple_key)
=> true
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Owenhorner/setting_store.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

