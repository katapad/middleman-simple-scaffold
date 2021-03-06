###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'


compass_config do |config|
  # config.output_style = :compact
  config.additional_import_paths = ['source/css/lib']
  config.environment = :development
end

###
# Page options, layouts, aliases and proxies
###

# Slim settings
# Set slim-lang output style
# Slim::Engine.set_default_options :pretty => true
set :slim, { :pretty => true, :sort_attrs => false, :format => :html5 }

# Set Shortcut
Slim::Engine.set_default_options :shortcut => {
  '#' => {:tag => 'div', :attr => 'id'},
  '.' => {:tag => 'div', :attr => 'class'},
  '&' => {:tag => 'input', :attr => 'type'}
}

# bower.js settings
ready do
  sprockets.append_path File.join root.to_s, "bower_components"
  # sprockets.append_path "#{root}/bower_components"

  # open
  # url = "http://#{my_address}:4567/"
  # command = "open -a \"Google Chrome Canary\" #{url}"
  # puts "url: #{url}"
  # puts "command: #{command}"
  #
  # system command
end


# ignore IDEA Files at LiveReload
file_watcher_ignore.push /^.idea\//

# activate :directory_indexes
#
# activate :gzip

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
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

# MiddlemanのSlimで複数のyieldを使う
# http://qiita.com/katapad/items/80aed62e688f22dc1e9d
Slim::Engine.set_default_options :streaming => false

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# set file names
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# livereload your browser, Firefox/Google Chrome/Safari
activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  compass_config do |config|
    # config.output_style = :compact
    config.environment = :production
  end

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# Deploy-specific configuration
activate :deploy do |deploy|
  deploy.build_before = true # default: false

  # git
  # deploy.method = :git
  # Optional Settings
  # deploy.remote = "custom-remote" # remote name or git url, default: origin
  # deploy.branch = "custom-branch" # default: gh-pages

  # ftp
  # deploy.method   = :ftp
  # deploy.host     = "ftp.example.com"
  # deploy.user     = "tvaughan"
  # deploy.password = "secret"
  # deploy.path     = "/srv/www/site"

  # sftp
  # require 'json'
  # json = JSON.load(File.read('.ftppass'))
  # ftp = json['test']
  #
  # deploy.method   = :sftp
  # deploy.host     = ftp['host']
  # deploy.user     = ftp['user']
  # deploy.password = ftp['password']
  # deploy.path     = ftp['remotePathi']
end
