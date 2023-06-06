# README

- Description

  - An example API app
  - Ruby version 3.2.2
  - Rails 7

- Starting rails app

  - cp config/application_example.yml config/application.yml
  - download datasource from https://tinyurl.com/2p9dtnde
  - store file:
    ```ruby
    ANSWERS_PATH: "storage/answers.csv"
    BUTTONS_PATH: "storage/buttons.csv"
    FAQ_GIGA_PATH: "storage/faq_giga.csv"
    FAQ_INVEST_PATH: "storage/faq_invest.csv"
    FAQ_TRADER_PATH: "storage/faq_trader.csv"
    FAQ_OTHER_PATH: "storage/faq_other.csv"
    ```
  - bundle install
  - rake export_yaml

- Code rules
  Running before push:
  - brakeman (for normal injections)
  - rubocop -A (for coding style)
