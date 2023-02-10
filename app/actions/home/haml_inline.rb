# frozen_string_literal: true

require "haml"
module Bookshelf
  module Actions
    module Home
      class HamlInline < Bookshelf::Action
        def handle(req, res)
          res.format = :html
          bg_color = "##{rand(100..999)}"
          str = %(
!!! 5
%html
  %head
    %title= "Request"
  %body{style: "background-color: #{bg_color};"}
    %table
      - req.each_pair do |k,v|
        %tr
          %th= k
          %td= v
      )
          bg_color = "##{rand(100..999)}"
          res.body = Haml::Template.new { str }
            .render(Object.new, {req: req.env.merge({time: Time.now, bg_color: bg_color}).to_h,
                                 bg_color: bg_color})
        end
      end
    end
  end
end
