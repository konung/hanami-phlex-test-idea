# frozen_string_literal: true

module Bookshelf
  module Actions
    module Home
      class JSON < Bookshelf::Action
        def handle(req, res)
          res.format = :json
          res.body = req.env.merge({time: Time.now, bg_color: "##{rand(100..999)}"}).to_json
        end
      end
    end
  end
end
