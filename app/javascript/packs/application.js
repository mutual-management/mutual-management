import Rails from "@rails/ujs";
// import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "../css/tailwindcss.css";
import '@fortawesome/fontawesome-free/js/all';
//import '~@fortawesome/fontawesome-free/scss/fontawesome';
require("jquery");
require("../src/flash_messages")
require("../src/edit_modal")
//require("../stylesheets/application");

import "../stylesheets/remodal-default-theme.css"
import "../stylesheets/remodal.css"
import "../stylesheets/remodal.min.js"

Rails.start();
Turbolinks.start();
ActiveStorage.start();

require('jquery')
require('modal.js')
require('schedule_modal.js')
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
