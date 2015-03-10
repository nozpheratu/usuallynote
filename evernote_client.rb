# https://github.com/evernote/evernote-sdk-ruby/blob/master/sample/client/EDAMTest.rb

require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require "digest/md5"
require 'evernote-thrift'
require 'pry'

authToken = ENV['EVERNOTE_AUTH_TOKEN']
evernoteHost = "sandbox.evernote.com"
userStoreUrl = "https://#{evernoteHost}/edam/user"

userStoreTransport = Thrift::HTTPClientTransport.new(userStoreUrl)
userStoreProtocol = Thrift::BinaryProtocol.new(userStoreTransport)
userStore = Evernote::EDAM::UserStore::UserStore::Client.new(userStoreProtocol)


versionOK = userStore.checkVersion("Evernote EDAMTest (Ruby)",
                                             Evernote::EDAM::UserStore::EDAM_VERSION_MAJOR,
                                                       Evernote::EDAM::UserStore::EDAM_VERSION_MINOR)
puts "Is my Evernote API version up to date?  #{versionOK}"
puts
exit(1) unless versionOK

noteStoreUrl = userStore.getNoteStoreUrl(authToken)

noteStoreTransport = Thrift::HTTPClientTransport.new(noteStoreUrl)
noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
noteStore = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)

# List all of the notebooks in the user's account
notebooks = noteStore.listNotebooks(authToken)

puts "Found #{notebooks.size} notebooks:"

defaultNotebook = notebooks.first

notebooks.each do |notebook|
  puts "  * #{notebook.name}"
end

