# Fonix Technical Challenge:
## Challenge requirements:

- The test must be done using Rails.
- Git must be used as version control (if possible push it to github).
- Messages should be sent through web sockets (Action Cable).

## Description:

- We want to create a Web chat.
- We'll start with a prototype which will have only one channel/room and all the users subscribed will have access to the only available channel.
- Users must be able to create an account providing a valid email address.
- Once logged in users must be able to send and receive messages.
- The system should send to all the users a weekly email specifying how many messages were sent and received in the last week and the total number of messages received since the user has sent his last message.
- I.e.: 600 messages have been exchanged in the last week.
        750 since your last message on the 1st of February

## Setup:

1.  Install ruby '2.7.0'
2. `gem install bundler`
3. `bundle install`
4. `bundle exec rails db:create RAILS_ENV=development`
5. `bundle exec rails db:migrate RAILS_ENV=development`
6. `bundle exec rails db:seed`
7. `rails server`

## Dependencies:

- redis-server should be runing on the default port
- run: `bundle exec sidekiq`

## Tests:

- Not created: TODO: Create Rspec for app
