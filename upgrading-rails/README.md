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
