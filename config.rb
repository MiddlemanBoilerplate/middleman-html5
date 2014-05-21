I18n.enforce_available_locales = false

activate :livereload

# require 'animation'
# require 'modernizr'

compass_config do |config|
  config.add_import_path "../bower_components/foundation/scss"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"
  config.output_style = :compressed
  config.sass_options = {:line_comments => false}
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
# page "/404.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

set :css_dir, 'assets/stylesheets'

set :js_dir, 'assets/javascripts'

set :images_dir, 'assets/images'

set :css_compressor, ::YUI::CssCompressor.new

set :haml, { :attr_wrapper => "\"" }

configure :build do

  activate :minify_javascript

  activate :favicon_maker, :icons => {
    "favicon_base.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-144x144-precomposed.png" },
      { icon: "apple-touch-icon-120x120-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-76x76-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "apple-touch-icon-60x60-precomposed.png" },
      { icon: "apple-touch-icon-57x57-precomposed.png" },
      { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
      { icon: "apple-touch-icon.png", size: "57x57" },
      { icon: "favicon-196x196.png" },
      { icon: "favicon-160x160.png" },
      { icon: "favicon-96x96.png" },
      { icon: "favicon-32x32.png" },
      { icon: "favicon-16x16.png" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
      { icon: "mstile-144x144", format: "png" },
    ]
  }

  activate :directory_indexes

  # activate :cache_buster

  activate :relative_assets

  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end