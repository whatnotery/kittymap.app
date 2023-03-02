# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "mapkick/bundle", to: "mapkick.bundle.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
