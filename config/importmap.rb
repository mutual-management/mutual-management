# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.js"
pin "@hotwired/stimulus", to: "stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin 'htm', to: "https://cdn.esm.sh/v45/htm@3.1.0/es2021/htm.js"
pin "react", to: "https://ga.jspm.io/npm:react@17.0.2/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@17.0.2/index.js"
pin "object-assign", to: "https://ga.jspm.io/npm:object-assign@4.1.1/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.20.2/index.js"
# pin 'chartjs', to: 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js'
# pin 'chartjs', to: 'https://cdnjs.cloudflare.com/ajax/libs/react-chartjs-2/3.2.0/index.js'
pin_all_from 'app/javascript/components', under: 'components'
