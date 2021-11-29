import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../css/tailwindcss.css";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('jquery')
require('modal.js')
require('schedule_modal.js')
