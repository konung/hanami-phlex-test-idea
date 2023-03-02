# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    # root { ( proc{["Hello from Hanami",rand.to_s]}.call  * (rand*100) ).join(" ") }
    root to: "home.show"
    get "/home/:id", to: "home.show"
    get "/books", to: "books.index"
    get "json", to: "home.json"
    get "haml_inline", to: "home.haml_inline"
    get "haml_template", to: "home.haml_template"
    get "phlex", to: "home.phlex"
    get "string", to: "home.show"
    get "show", to: "home.show"
    get "papercraft", to: "home.papercraft"
  end
end
