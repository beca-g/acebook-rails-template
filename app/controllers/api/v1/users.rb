module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
      
      desc "Return all users"
        get "" do
          User.all
      end
      
      desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id" do
          User.where(id: permitted_params[:id]).first!
        end
      
      desc "Create a user"
        params do
          requires :username, type: String, desc:"username"
          requires :email, type: String, desc:"email"
          requires :password, type: String, desc: "password"
        end
        post "" do
          User.create!(declared(params))
        end

      desc "deletes a user"
        params do
          requires :id, type: String, desc: "user id"
        end
        delete ':id' do
        User.find(params[:id]).destroy!
        end
      end
    end
  end
end