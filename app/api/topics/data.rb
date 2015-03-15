module Topics
  class Data < Grape::API
    resource :topics do
      desc "List all Topics"
      get do
        Topic.all
      end
    end
  end
end
