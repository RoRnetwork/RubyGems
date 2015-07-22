#Ruby 1.9.3 & Rails 3.2.13
###Gems without version
Gem::InstallError: prawn requires Ruby version >= 2.0.0.
An error occurred while installing prawn (2.0.2), and Bundler cannot continue.
Make sure that `gem install prawn -v '2.0.2'` succeeds before bundling.
###Commenting prawn gem
##After bundle install
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
Post-install message from ruby-graphviz:

You need to install GraphViz (http://graphviz.org/) to use this Gem.

For more information about Ruby-Graphviz :
* Doc : http://rdoc.info/projects/glejeune/Ruby-Graphviz
* Sources : http://github.com/glejeune/Ruby-Graphviz
* Mailing List : http://groups.google.com/group/ruby-graphviz

Last (important) changes :
Ruby-Graphviz no longer supports Ruby < 1.9.3
  Post-install message from wash_out:
    Please replace `include WashOut::SOAP` with `soap_service`
    in your controllers if you are upgrading from a version before 0.8.5.

###rails s

/home/shan/.rvm/gems/ruby-1.9.3-p551/gems/feedzirra-0.8.0/lib/feedzirra.rb:2:in `<top (required)>': This project has been renamed Feedjira, find out more at feedjira.com. (RuntimeError)

Commented

`# gem 'feedzirra'`
added

`gem 'feedjira'`

####Again started rails s

`rails s`

/home/shan/.rvm/gems/ruby-1.9.3-p551/gems/activesupport-3.2.13/lib/active_support/dependencies.rb:251:in `require': /home/shan/.rvm/gems/ruby-1.9.3-p551/gems/wice_grid-3.4.14/lib/wice/wice_grid_misc.rb:98: syntax error, unexpected tLABEL (SyntaxError)
      def value_for(key, strict: true) #:nodoc:

Now I got the above error. I think it is related to ruby new hash.
Commenting `wice_grid` for a while.

`# gem 'wice_grid'`

####Again started rails s

/home/shan/.rvm/gems/ruby-1.9.3-p551/gems/activesupport-3.2.13/lib/active_support/core_ext/module/aliasing.rb:31:in `alias_method': undefined method `tables' for class `ActiveRecord::ConnectionAdapters::PostgreSQLAdapter' (NameError)

Commented

`# gem 'rails_sql_views'`

####Again started rails s

working fine with few warnings:

DEPRECATION WARNING: Support for Rails < 4.1.0 will be dropped. (called from warn at /home/shan/.rvm/rubies/ruby-1.9.3-p551/lib/ruby/1.9.1/forwardable.rb:201)

DEPRECATION WARNING: silence is deprecated and will be removed from Rails 4.0. (called from table_exists_with_silencer? at (eval):2)

Will fix it later.

####created simple scaffold resource in ruby 1.9.3 and rails 3.2

Taking Gemfile.lock backup for ruby 1.9.3

`Gemfile_ruby193_backup`

###rvm use 2.2.2

`bundle install`

IMPORTANT! Some of the defaults have changed in Capybara 2.1. If you're experiencing failures,
please revert to the old behaviour by setting:

    Capybara.configure do |config|
      config.match = :one
      config.exact_options = true
      config.ignore_hidden_elements = true
      config.visible_text_only = true
    end

If you're migrating from Capybara 1.x, try:

    Capybara.configure do |config|
      config.match = :prefer_exact
      config.ignore_hidden_elements = false
    end

Details here: http://www.elabs.se/blog/60-introducing-capybara-2-1

####rails s

still getting few warnings:

/home/shan/.rvm/gems/ruby-2.2.2/gems/activesupport-3.2.13/lib/active_support/values/time_zone.rb:270: warning: circular argument reference - now
DEPRECATION WARNING: Support for Rails < 4.1.0 will be dropped. (called from warn at /home/shan/.rvm/rubies/ruby-2.2.2/lib/ruby/2.2.0/forwardable.rb:183)

DEPRECATION WARNING: silence is deprecated and will be removed from Rails 4.0. (called from column_definitions_with_silencer at (eval):2)

rest of the function working fine.

### upgrading rails from 3.2.13 to 4.2.3

Just removed Gemfile.lock file, and running `bundle install`

Done successfully !!!

###rails s

/home/shan/.rvm/gems/ruby-2.2.2/gems/activerecord-4.2.3/lib/active_record/dynamic_matchers.rb:26:in `method_missing': undefined method `attr_accessible' for #<Class:0x00000002c03be8> (NoMethodError)

To fix the above error, added `gem 'protected_attributes'` in `Gemfile`.

`bundle install` & `rails s`
