# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation 

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* add an upstream git repo with this command in the terminal
$ git remote add origin remote repo URL 
$ git push origin master

* change the name of the app and the name of the database in config/database.yml

* set up the database:
rails db:setup

* add the administrate gem with: 

$ rails generate administrate:install
* and to add more dashboards use:

$ rails generate administrate:dashboard Foo where Foo is the model name.

* adding photos/videos
* create a model and controller: 
class AddPhotoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :photo, :string
  end
end

* add attachment to model
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
end

see: https://medium.com/@clarkjohnson_85334/uploading-photos-into-rails-6-activestorage-from-javascript-react-file-and-camera-653de99b183f for more


