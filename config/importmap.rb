# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "flatpickr" # @4.6.13
pin "@stripe/stripe-js", to: "@stripe--stripe-js.js" # @7.4.0pin "mapbox" # @1.0.0
pin "mapbox-gl" # @3.1.2
pin "process" # @2.1.0
pin "swiper" # @11.2.10
