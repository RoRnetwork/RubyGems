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
