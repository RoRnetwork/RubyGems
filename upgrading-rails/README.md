#Upgrading Ruby and Rails

`Ruby` from version `1.9.3` to `2.2.2`
`Rails` from version `3.2.13` to `4.2.3`

##Steps for upgrading Ruby and Rails
###Creating a new rails application with Ruby 1.9.3 and Rails 3.2.13

    rails _3.2.13_ new upgrading-rails -d postgresql

You can get here the initial directory structure of Rails 3.2.13

Creating simple scaffold:

    rails g scaffold Union name

Running migration command:

    rake db:create
    rake db:migrate

###Now upgrading Ruby version from 1.9.3 to 2.2.2

If you have already installed `rvm` in your machine, To install preferred Ruby version

    rvm install 2.2.2

And now switch to Ruby 2.2.2,

    rvm use 2.2.2

Just mentioning Ruby version in `Gemfile`

    ruby '2.2.2'

Then, run your `rails server`

Now everything is working fine but with one warning.

    /home/shan/.rvm/gems/ruby-2.2.2/gems/activesupport-3.2.13/lib/active_support/values/time_zone.rb:270: warning: circular argument reference - now

This stats activesupport-3.2.13 is not supported with Ruby 2.2.2. So we need to upgrade the Rails version.

###Now Upgrading Rails version from 3.2.13 to 4.2.13

To install rails 4.2.3

    gem install rails -v 4.2.3

Modify rails version in Gemfile:

    rails '4.2.3'

we are upgrading the rails gem, so we need to update the bundle,

    bundle update

You probably will get the following error,  

Bundler could not find compatible versions for gem "railties":
    In Gemfile:
      rails (= 4.2.3) ruby depends on
        railties (= 4.2.3) ruby

      sass-rails (~> 3.2.3) ruby depends on
        railties (~> 3.2.0.beta) ruby

we have modified rails version, in the same way we need to modify assets gems version

Before:

     group :assets do
      gem 'sass-rails',   '~> 3.2.3'
      gem 'coffee-rails', '~> 3.2.1'
      gem 'uglifier', '>= 1.0.3'
    end

After:

    gem 'sass-rails', '~> 5.0'
    gem 'coffee-rails', '~> 4.1.0'
    gem 'uglifier', '>= 1.3.0'

Please notice: assets gem grouping is not required for Rails 4.2.3. So remove the grouping.

Now bundle successfully updated!

Running rails server

    rails s

It is running successfully with a warnings. we will fix it.

    config.eager_load is set to nil. Please update your config/environments/*.rb files accordingly:

      * development - set it to false
      * test - set it to false (unless you use a tool that preloads your test environment)
      * production - set it to true


Added eager_load configuration in  environments files as follows:

In `development.rb` and 'test.rb',

    config.eager_load = false

In `production.rb`

    config.eager_load = false

Restarting rails server.

      rails s

Running successfully, but if start using the application. it gives a DEPRECATION WARNING and breaking with an error.

      DEPRECATION WARNING: You didn't set `secret_key_base`. Read the upgrade documentation to learn more about this new config option. (called from service at /home/shan/.rvm/rubies/ruby-2.2.2/lib/ruby/2.2.0/webrick/httpserver.rb:138)

      NoMethodError (undefined method `whitelist_attributes=' for #<Class:0x00000002179e70>):


To remove the DEPRECATION WARNING,

Remove the `secret_token.rb` initializer and Create a `secrets.yml` file in your `config` folder with the following content:

    development:
      secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>

    test:
      secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>

    production:
      secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>

Use `rake secret` to generate new `SECRET_KEY_BASE` for the `development`, `test` and `production` sections.

Now restart `rails server`. now DEPRECATION WARNING has been fixed.

Rails 4.x has removed `attr_accessible` and `attr_protected` feature in favor of `Strong Parameters`. You can use the `Protected Attributes gem` for a smooth upgrade path.

If you are not using `Protected Attributes`, you can remove any options related to this gem such as `whitelist_attributes` or `mass_assignment_sanitizer` options.

Add in Gemfile:

    gem 'protected_attributes'

`bundle install`

Now `whitelist_attributes` error has been fixed, next error araised,

    NoMethodError (undefined method `auto_explain_threshold_in_seconds=' for #<Class:0x00000002382c80>):

Actually this `auto_explain_threshold_in_seconds` configuration has been added while migrating from rails 3.1 to 3.2.
But from rails 4.0 onwards it has been deprecated,

    Remove automatic execution of EXPLAIN queries. The option  `active_record.auto_explain_threshold_in_seconds` is no longer used and should be removed.

So we can remove from `development.rb` environment file.

Restart `rails server`

Yay!!!!! Now everything is working fine.

Now we upgraded rails to 4.2.3 successfully. Existing functions are working fine.

Lets create a new scaffold and test the same.

    rails g scaffold Article name

`rake db:migrate`

If you look the newly created model `artcile.rb`.  It does not contain `attr_accessible`. And Articles controller  `articles_controller.rb` has strong parameters.


Great! Now everything is working. Then whatelse?
