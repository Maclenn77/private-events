# Private events

## Description

This app is a Rails project for the Microverse's RoR curriculum, following TOP curriculum for webdevelopment. We have practiced how to do associations and much more.


## About the project

In this app, you can create events and invite people to them!

## Authorization

For creating events, you need to log in firts. Password is not required. If you don't have a user, create a new one.

## Screenshots

### Logged out. You can see the events, but you can't create new ones.

![Page with user logged out](https://user-images.githubusercontent.com/1808402/85887693-e5273a80-b7ad-11ea-9af4-5c571cdf9df1.png)

### Log in page. If user doesn't exist, go to sign up for creating a new user.

![Log in page](https://user-images.githubusercontent.com/1808402/85887919-3fc09680-b7ae-11ea-874f-ab2a4666f087.png)

### Logged user. You can create new events and invite people to them!!!

![Logged user](https://user-images.githubusercontent.com/1808402/85887926-418a5a00-b7ae-11ea-8d81-9cb8ae23363b.png)

### User's show page. You can see events created by that user, future and past events.

![User's show page](https://user-images.githubusercontent.com/1808402/85887930-43541d80-b7ae-11ea-9a6f-bd82fb504983.png)

### Create new event. You can invite people. If the user doesn't exists, it creates a new one.
![Create new event](https://user-images.githubusercontent.com/1808402/85887938-45b67780-b7ae-11ea-8f09-0ee1a08b98cd.png)

## Validations

- New users need to have an unique username.
- Events need to have a location, a description and a date.

## Built With

- [Ruby](https://www.ruby-lang.org/en/) 2.7.0 - A programming language.
- [Ruby on Rails](https://rubyonrails.org/) 6.0.3.1 - A Ruby framework for web development
- Bootstrap

## Getting started

### Prerequisites

- Ruby
- Rails
- Bundle
- SQLite3. **Note**: You can change the database in GemFile.

#### For testing

- Capybara
- Rspec-Rails

### Installing

1. Download this repository

`$ git clone repo_url`

2. Install all required gem.

`$ bundle install`

3. Migrate the database.

`$ rails db:migrate`

### Running the tests

You can run tests with

`$ rspec `

## Authors

👤 **Pedro Donda**

- Github: [@Phfdonda](https://github.com/phfdonda)
- Twitter: [@srjuanpapas](https://twitter.com/phfdonda)
- Linkedin: [Pedro Donda](https://www.linkedin.com/in/pedro-donda-808621bb/)
- Contact: [E-mail](phfdonda@gmail.com)

👤 **Juan Paulo Perez Tejada**

- Github: [@Maclenn77](https://github.com/Maclenn77)
- Twitter: [@srjuanpapas](https://twitter.com/srjuanpapas)
- Linkedin: [Juan Paulo Perez Tejada](https://mx.linkedin.com/in/juanpaulopereztejada)

Visit [my blog](https://developerz.software/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
