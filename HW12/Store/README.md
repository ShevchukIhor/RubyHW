# README

## How to use

**Type in console:**

```ruby
git clone https://github.com/ShevchukIhor/RubyHW/tree/main/HW12
```

```ruby
cd RubyHW/HW12/Store
````

```ruby
gem install bundler
```
```ruby
bundle install
```

**Attach ```config/database.yml``` acording `database_example.yml` with your username and password**

**Type in console:**

```ruby
rails db:create
```

```ruby
rails db:migrate
```

```ruby
rails db:seed
```
or
```ruby
rails db:setup
```
```ruby
rails s
```

**Run online store in browser:**
```ruby
http://127.0.0.1:3000/
```
**Login with ```user@example.com```, password: ```password```**
**or SignUp new user**

**Run admin panel in browser:**
```ruby
http://127.0.0.1:3000/admin
```
**Login with ```admin@example.com```, password: ```password```**
