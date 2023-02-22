# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "leaflet", to: "https://ga.jspm.io/npm:leaflet@1.9.2/dist/leaflet-src.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
