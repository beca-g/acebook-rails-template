module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      resource :posts do

        # helpers do
        #   def current_user
        #     @current_user ||= User.authorize!(env)
        #   end
        # end


      desc "Creates a new post"
        params do 
          requires :message, type: String, desc: "message of the post"
          requires :user_id, type: String, desc: "Username of current user"
        end 
        post do
          Post.create!(declared(params))
        end 

      desc "Return all posts"
        get "" do
          Post.all
        end

      desc "Return a post"
        params do
          requires :id, type: String, desc: "ID of the post"
        end
        get ":id" do
          Post.where(id: permitted_params[:id]).first!
        end

      # currently not working
      # desc "amends a post"
      #   params do
      #     requires :message, type: String, desc: "updated message"
      #     requires :user_id, type: String, desc: "ID of the user"
      #   end
      #   route_param :id do
      #   put ':id' do
      #   Post.find(params[:id]).update
   
      #   end
      # end


      desc "deletes a post"
        params do
        requires :id, type: String
      end
        delete ':id' do
        Post.find(params[:id]).destroy!
      end
     


      end
    end
  end
end