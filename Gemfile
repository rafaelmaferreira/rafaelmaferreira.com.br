# frozen_string_literal: true

source "https://rubygems.org"

gem "jekyll", "~> 4.3.2"
gem "jekyll-theme-chirpy", "~> 6.2", ">= 6.2.3"

# Plugins úteis para Jekyll
gem "jekyll-seo-tag", "~> 2.7", ">= 2.7.1"
gem "jekyll-sitemap", "~> 1.4", ">= 1.4.0"
gem "jekyll-feed", "~> 0.15", ">= 0.15.1"

group :development do
  gem "jekyll-admin", "~> 0.11", ">= 0.11.0"
  gem "webrick", "~> 1.7", ">= 1.7.0" # Necessário para Jekyll no Ruby 3.0+
end

group :test do
  gem "html-proofer", "~> 4.4"
end

group :jekyll_plugins do
  gem "jekyll-paginate", "~> 1.1", ">= 1.1.0"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
