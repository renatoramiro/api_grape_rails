module Employee
  class Data < Grape::API
    resource :employee do
      desc "List all Employee"
      get do
        EmpData.all
      end

      desc "create a new employee"
      params do
        requires :name, type: String
        requires :address, type: String
        requires :age, type: Integer
      end
      post do
        EmpData.create!({
          name: params[:name],
          address: params[:address],
          age: params[:age]
        })
      end

      desc "update an employee"
      params do
        requires :id, type: String
        requires :name, type: String
        requires :address, type: String
        requires :age, type: String
      end
      put ":id" do
        EmpData.find(params[:id]).update({
          name: params[:name],
          address: params[:address],
          age: params[:age]
        })
      end

      desc "delete an employee"
      params do
        requires :id, type: String
      end
      delete ':id' do
        EmpData.find(params[:id]).destroy!
      end
    end
  end
end
