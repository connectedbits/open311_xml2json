require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'lib/open311'
require 'lib/open311/xml2json'

xml2json = Open311::Xml2Json.new
xml2json.transform