// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('../utilities/sorting')
require('../utilities/password_check')
require('../utilities/form_inline')
require('../utilities/progress-bar')

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// import "bootstrap/dist/js/bootstrap"
// import "bootstrap/dist/css/bootstrap"
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
