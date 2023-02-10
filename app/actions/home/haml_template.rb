# frozen_string_literal: true

require "haml"
module Bookshelf
  module Actions
    module Home
      class HamlTemplate < Bookshelf::Action
        def handle(req, res)
          res.format = :html
          bg_color = "##{rand(100..999)}"
          res.body = Haml::Template.new("app/actions/home/haml_template.haml")
            .render(Object.new, {req: req.env.merge({time: Time.now, bg_color: bg_color}).to_h,
                                 bg_color: bg_color})
        end
      end
    end
  end
end
