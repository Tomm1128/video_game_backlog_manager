# Video Game Archive

This project was a Ruby on Rails project.

## Table of Contents

- [Installation](#installation)
- [Setup](#setup)
- [Overview](#overview)

## Installation

To get started with setting up the project, cd into the repo and run:

```sh
bundle install
```

```sh
bundle exec rake db:migrate
bundle exec rake db:seed
```

## Setup

Now that the backend should be set up properly, start the server by:

```sh
rails s
```

Then just visit http://localhost:3000/ to view the app. 

## Overview

This app helps you organize and track all the games you own. Add games to your backlog, mark them as completed, track your playtime, review them, and more!

On page load, Video Game Archive will show you a login screen. You can use one of the users in the database or feel free to create your own user using the sign up link. You should now stay signed in and the app should track the user across each page. Now that you are signed in, you can now use the features Video Game Archive has:

### Features include:

- Add a reviews to video games
- Edit your reviews
- View Profile page, display username and video games in collection
  - Add games to each of the three collections you can have Wishlist, In-Progress, and Completed.
- View all the games in the app that have been reviewed.
- Home page shows the three highest rated games in the app. 
