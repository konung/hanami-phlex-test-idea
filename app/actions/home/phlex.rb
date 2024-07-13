# frozen_string_literal: true

require 'phlex'
module Bookshelf
  module Actions
    module Home
      class Phlex < Bookshelf::Action
        def handle(req, res)
          res.format = :html
          bg_color = "##{rand(100..999)}"
          res.body = PhlexTemplate.new(req: req.env.merge({ time: Time.now, bg_color: }).to_h,
                                       bg_color:).call
        end
      end

      class PhlexTemplate < ::Phlex::HTML
        def initialize(req:, bg_color:)
          @req = req
          @bg_color = bg_color
        end

        def template
          html do
            head do
              title { 'Request' }
            end
            body style: "background-color: #{@bg_color};" do
              table do
                @req.each_pair do |k, v|
                  tr do
                    th { k }
                    td { v }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
