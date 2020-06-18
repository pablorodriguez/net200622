# HiPer Stub
Last Updated: 2020-05-08

## Overview
This is an example application that contains most of the underpinnings of most of XSELL's applications.  At the time of this document, most applications use Rails 5.2.X, Ruby 2.4.X, and Ruby 2.5.X.

### Authentication
[Devise](https://github.com/heartcombo/devise) is used as the main authentication framework.  Currently, all apps utilize the [Database Authenticatable](http://www.rubydoc.info/github/heartcombo/devise/master/Devise/Models/DatabaseAuthenticatable) strategy.  That is, each application maintains their own sets of users.

### Authorization
Authorization is done with a combination of [Pundit](https://github.com/varvet/pundit) and [Rolify](https://github.com/RolifyCommunity/rolify).
- Pundit is used to provide authorization for controller actions, as well as for scoping database queries.
- Rolify provides user roles.  User roles are often used in authorization checks by Pundit.

#### Roles
Most applications have a fairly straightforward set of roles:

role | description
---- | -----------
admin | super user.  Has access to everything
manager | typically has access to reporting features, as well as some user administration

### Multi-tenancy
[Apartment](https://github.com/influitive/apartment) and PostgreSQL schemas are used to provide multi-tenancy.  The subdomain elevator strategy is used to automatically switch tenants based on DNS address.

### In-memory key store
Redis is the technology of choice for in-memory caching.

### Testing
[RSpec](https://github.com/rspec/rspec-rails) is the testing framework of choice.

### Deployment
[Capistrano](https://capistranorb.com/) is the deployment tool of choice.

### Secrets
XSELL uses pre-Rails 5.1 style non-encrypted secrets.  Encrypted secrets are used to define the secret key base only.

## Style Preferences
XSELL adheres to the a set of style guidelines and standards that are based on the community style guides:
- [Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide)
- [Rails Style Guide](https://github.com/rubocop-hq/rails-style-guide)
- [RSpec Style Guide](https://github.com/rubocop-hq/rspec-style-guide)

In addition to the above, XSELL relies of the service object pattern to keep controllers and models skinny.

For more information, please refer to **XSELL Coding Guidelines and Standards** document.

## Getting Started
1. copy `config/database.example.yml` to `config/database.yml` Customize as needed.
2. copy `config/secrets.example.yml` to `config/secrets.yml`.  Customize as needed.
3. install dependencies:
```
bundle install
yarn
```
4. Initialize your database:
```
RAILS_ENV=development bundle exec rails db:create db:migrate db:seed
```
This will create the 'abc' tenant.

5. Add the following entries to `/etc/hosts`:
```
127.0.0.1   abc.local.test
```
6. Start the development server:
```
RAILS_ENV=development bundle exec rails s
```
7. From your browser, navigate to: `http://abc.local.test:3000`
8. Log in as:

username | password
-------- | --------
admin@abc.com | password

## Running specs
1. Initialize your database:
```
RAILS_ENV=test bundle exec rails db:create db:migrate db:seed
```
2. Execute:
```
bundle exec rspec -fd
```

## Known Bugs
### Webpack compiler issue
**Problem**:
```
Error: Cannot find module 'node-libs-browser/mock/empty'
```

**Cause**:<br/>
Incompatibilities with `node-libs-browser` v2.2.1

**Resolution**:<br/>
Downgrade to `node-libs-browser` v2.2.0<br/>
1. merge branch `bugfix/node-libs-browser-v2.2.0`

