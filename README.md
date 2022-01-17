# PARKS_API

The PARKS_API is the Picnic Victoria App database, made for fake client Parks Victoria + the Victorian State Government.

### **What is PARKS_API?**

The PARKS_API was built to supply local park amenity data for the [Picnic Victoria App website](https://picnic-vic.netlify.app). [React Repo Here](https://github.com/PicnicVic/parks_react).

PARKS_API is a database of small parks in Melbourne that aren't well documented as the state parks as part of Parks Victoria's website.

_Park details include:_

- name 
- address
- category
- feature
- rating

Only the **Admin** with authentication privilege can use CRUD functions to Create, Update and Delete parks.

**Users** when signed into the app can only Read the posts and can not edit. **Users** can apply comments to the park as commentary to their experience.

_Park Comment details include:_

- Comment
- Updated At
- User who commented
- Park the comment is applied too

This database also doubles as the **User database** for those interacting with the Picnic Victoria App.

_User details include:_

- username
- email
- password

### System & Gem dependencies

- Ruby version: ruby 2.7.2p137
- Rails version: rails 6.1.4.1
- PostgreSQL: 'pg', '~> 1.1'
- Bcrypt: 'bcrypt', '~> 3.1.7'
- Rack CORS: 'rack-cors'
- JWT Authentication: 'jwt'
- AWS image buckets: "aws-sdk-s3", "~> 1.111"

### Development & Testing Gem dependencies

- RSPEC: 'rspec-rails'
- ByeBug: 'byebug'
- FactoryBot: 'factory_bot_rails'
- Database Cleaner: 'database_cleaner'
- Controller Testing: 'rails-controller-testing'

### Endpoint definitions

### Code snippets

### Example responses
