# Rails5 And MongoDB

## Requirements
- Ruby 2.4
- Rails 5
- MongoDB 3.6.2

## Setup
#### MongoDB
- If MongoDB is not installed already, install it using: `brew install mongodb`
- Then run: `sudo mkdir -p /data/db`
- Run MongoDB server: `mongod`
#### Application
- Goto project's directory in your terminal
- Run `bundle install`
#### DoorKeeper setup for OAuth2 authentication
- `rails generate doorkeeper:install`
- `rails generate doorkeeper:mongo_mapper:indexes`
#### Create index for mongodb
- `rails db:mongoid:create_indexes`
#### Seed data using faker gem
- `rails db:seed`

## See the application in action
- Start the local server using `rails server`
#### Get token
1. Visit `http://127.0.0.1:3000/oauth/applications/new` and provide the details there and click `submit`. It will redirect you to next page.
2. Then on next page displayed, click on `Authorize` button. It will show you the Authorization code.
3. Now using postman (or any http client), do the post request to `http://127.0.0.1:3000/oauth/token/` providing the following parameters:
 `client_id=APPLICATION-ID&client_secret=APPLICATION_SECRET&code=AUTHORIZATION-CODE&grant_type=authorization_code&redirect_uri=urn:ietf:wg:oauth:2.0:oob`
#### Search results
- To see the token based authorization in action visit: `http://127.0.0.1:3000/get-book-info/?q=SEARCH-TERM&access_token=ACCESS-TOKEN-RECEIVED-IN-STEP3`