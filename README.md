# Clipboard Presenter Plugin

A [COPRL](http://github.com/coprl/coprl) presenter plugin that provides clipboard
interaction.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clipboard_presenter_plugin', git: 'https://github.com/coprl/clipboard_presenter_plugin', require: false
```

And then execute:

    $ bundle


## Actions

The clipboard_presenter_plugin provides the following actions:

* Copy from an element: `clipboard copy: :some_field`
* Cut from an element: `clipboard cut: :some_field`

## Usage

Include the clipboard_presenter_plugin either globally via the `plugins`
configuration setting

```ruby
# config/initializers/presenters.rb
Coprl::Presenters::Settings.configure do |config|
  config.presenters.plugins << :clipboard
  # Now `clipboard` is available in every POM!
end
```

or on a per-POM basis via the `plugin` method.

```ruby
# presenters/foos/view.pom
Coprl::Presenters.define(:view, namespace: :foos) do
  plugin :clipboard

  # ...
end
```

Then, use one of the clipboard actions in an event handler.

```ruby
text_field id: :my_secret_token do
  value current_user.super_secret_token
end

button icon: :file_copy do
  tooltip 'Copy token'

  event :click do
    clipboard copy: :my_secret_token
    snackbar 'Copied token to clipboard!'
  end
end
```

## Browser support

The following browsers are considered officially supported:

* Chrome 42+
* Edge 12+
* Firefox 41+
* Safari 10+

## Building

0. `nvm use && npm i`
1. `npm run type-check`
2. Compile TS to JS: `npm run build` (output: `views/clipboard/build`)
3. Transpile and bundle via Babel and Webpack: `npm run bundle:dev` (output:
   `dist/bundle.js`)

Or, `npm run watch` to watch `views/clipboard/src` for changes and run steps 1-3 above.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/coprl/clipboard_presenter_plugin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the COPRL project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/coprl/coprl/blob/master/CODE-OF-CONDUCT.md).
