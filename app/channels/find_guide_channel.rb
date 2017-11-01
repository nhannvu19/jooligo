class FindGuideChannel < ApplicationCable::Channel
    def subscribed
        stream_from 'findguide'
    end
end