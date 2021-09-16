# appium-capybara-teladoc
Sample automation framework which tests mobile apps
using [appium](http://appium.io/),  [capybara](https://github.com/teamcapybara/capybara) and [cucumber](https://cucumber.io).

## Environment
In order to use this project, the environment must be configured with necessary dependencies.

## Install bundler gem (in order to execute 'bundle install' from CLI)
```bash
$ gem install bundler

## Run Tests
Setup for all tests, regardless of platform and browser:
# Open new terminal window and go to the repo's root directory on your computer
$ cd path/to/the/repo/appium-capybara-teladoc

# Install gems listed in Gemfile to vendor/gems (will take a little while)
$ bundle install
```

Finally, to trigger cucumber tests, run one of these commands (depending on the platform you want to test):
```bash
# The profiles are stored in config/cucumber.yml
# I HIGHLY recommend using cucumber profiles.

# Chrome desktop
$ bundle exec cucumber --profile appium