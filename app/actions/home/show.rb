# frozen_string_literal: true

require "haml"
module Bookshelf
  module Actions
    module Home
      class HamlExample < Bookshelf::Action
        def handle(request, response)
          # response.body = self.class.name
          # response.body = "Welcome to Bookshelf"
          response.format = :html
          # response.format = :json
          #  response.body = request.env.merge({:time => Time.now}).to_json
          #  response.body = "<time>#{Time.now}</time>"
          #  response.body =  Haml::Template.new{ "%p{style: 'background-color: #f00;'} Haml code!" }.render
          #           str = %Q(
          # !!! 5
          # %html
          #   %head
          #     %title= "Request"
          #   %body{style: "background-color: ##{rand(100..999)};"}
          #     %table
          #       - req.each_pair do |k,v|
          #         %tr
          #           %th= k
          #           %td= v

          # )
          # request.env.merge({time: Time.now}).each_pair do |k, v|
          #   #  response.body += "<p>#{k.class.name} => #{v.class.name}</p>"
          #   # response.body << "<p>#{k} => #{v}</p>"
          # end

          response.body = Haml::Template.new("app/actions/home/show.haml").render(Object.new, {req: request.env.merge({time: Time.now}).to_h, bg_color: rand(100..999)})
        end
      end
    end
  end
end
