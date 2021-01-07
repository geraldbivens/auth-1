# README

Steps to create a new user with a secure password:

* Create a new rails api `rails new auth-1 --api`

* Enable `gem 'bcrypt', '~> 3.1.7'` by uncommenting it in the Gemfile, then install it by running `bundle install`

* Create a User resource `rails g resource User username password`

* Add the `password_digest` attribute to the password column in the users table, then migrate the database `rails db:migrate`

* Add a route to create a new user
```
Rails.application.routes.draw do
  resources :users, only: [:create]
end
```

* Add a create action to create a new user
```
class UsersController < ApplicationController
    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )

        render json: @user, status: :created
    end
end
```

* Add the `has_secure_password` macro to the User model
```
class User < ApplicationRecord
    has_secure_password
end
```

* Open the Postman browser and test to see if you can create a new user with a secure password
