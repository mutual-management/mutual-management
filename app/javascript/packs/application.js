import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../css/tailwindcss.css";
import "../stylesheets/calendar.css"
import "../stylesheets/flash_message.css"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('jquery')
require('modal.js')
require('keypad.js')
require('expense_category_button.js')
require('schedule_modal.js')

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
