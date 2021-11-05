import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "../css/tailwindcss.css";
import '@fortawesome/fontawesome-free/js/all';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

