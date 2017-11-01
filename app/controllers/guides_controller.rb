class GuidesController < ApplicationController
    def select
        ActionCable.server.broadcast "findguide",
            username: "LThg.24",
            phone: "0979151147"
        head :ok
    end
end