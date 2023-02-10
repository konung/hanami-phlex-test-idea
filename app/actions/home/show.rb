# frozen_string_literal: true

require "haml"
module Bookshelf
  module Actions
    module Home
      class Show < Bookshelf::Action
        def handle(request, response)
          # response.body = self.class.name
          # response.body = "Welcome to Bookshelf"
          response.format = :html
          bg_color = "##{rand(100..999)}"
          str = %(<html>
          <head>
            <title>Request</title>
          </head>
          <body style="background-color: #{bg_color};">
            <table>)

          request.env.merge({time: Time.now, bg_color: bg_color}).each_pair do |k, v|
            str << "<tr><td>#{k}</td><td>#{v}</td></tr>"
          end

          str << %(</tr>
            </table>
          </body>
        </html>)
          response.body = str
        end
      end
    end
  end
end
