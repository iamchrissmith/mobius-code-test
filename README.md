A basic Rails application where users have credits they can send and receive from other users.

Uses:
* Rails 5.1.2
* PostgreSQL
* Ruby 2.4.1

## To Try This Project Yourself

1. Clone the repo
2. cd mobius
3. Run `bundle`
4. Run `rake db:{create,migrate,seed}` to setup and seed the database
5. Run `rails s` to start the server and navigate to `http://localhost:3000`
6. Create a new user or login using `user-0@email.com` and `user` for the password
Once you are logged in you can send Credit to any other user and your balance will update.
You can see the tests by running `rspec` from within the repo.

The project also has an API endpoint `/api/v1/users/current` that will give you the email and balance of the currently logged in user (i.e. it is dependent on you logging in first as described above).

