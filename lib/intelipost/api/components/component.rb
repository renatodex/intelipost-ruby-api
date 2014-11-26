module Intelipost::ApiComponents
  class Component
    def has_error?(response)
      response["messages"].count > 0
    end
  end
end
