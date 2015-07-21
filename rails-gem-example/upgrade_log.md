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
