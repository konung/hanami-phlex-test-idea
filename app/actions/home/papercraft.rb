# frozen_string_literal: true

require "papercraft"

module Bookshelf
  module Actions
    module Home
      class Papercraft < Bookshelf::Action
        def handle(req, res)
          res.format = :html
          bg_color = "##{rand(100..999)}"
          res.body = template(req, bg_color)
        end

        def template(req, bg_color)
          ::Papercraft.html {
            head {
              title "Request"
            }
            body(style: "background-color: #{bg_color};") {
              table {
                req.env.merge({time: Time.now, bg_color: bg_color}).to_h.each_pair { |k, v|
                  tr {
                    th k
                    td v
                  }
                }
              }
            }
          }.render
        end
      end
    end
  end
end
