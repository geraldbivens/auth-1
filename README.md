# README

Create a new user with a secure password:

* Create a new rails api `rails new auth-1 --api`

* Enable `gem 'bcrypt', '~> 3.1.7'` by uncommenting it in the Gemfile, then install it by running `bundle install`

* Create a User resource `rails g resource User username password`

* Add the 'digest' attribute to the password column in the users table `password_digest`, then migrate the database `rails db:migrate`

* Add a route to create a new user `resources :users, only: [:create]`

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

* Add the secure password macro to the User model `has_secure_password`
```
class User < ApplicationRecord
    has_secure_password
end
```

* Open the Postman browser and test to see if you can create a new user with a hashed password
