# frozen_string_literal: true

# Pagy initializer file (3.8.1)
# Customize only what you really need and notice that Pagy works also without any of the following lines.
# Should you just cherry pick part of this file, please maintain the require-order of the extras

# Extras
# See https://ddnexus.github.io/pagy/extras

# Feature Extras

# Headers extra: http response headers (and other helpers) useful for API pagination
# See http://ddnexus.github.io/pagy/extras/headers
require 'pagy/extras/headers'
Pagy::VARS[:headers] = { page: 'Current-Page', items: 'Page-Items', count: 'Total-Count', pages: 'Total-Pages' }
Pagy::VARS[:items] = 10
