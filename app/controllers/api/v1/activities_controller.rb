module API
    module V1
      class ActivitiesController < ApplicationController
        before_action :set_activity, only: [:show, :edit, :update, :destroy, :extend]
        before_action :authenticate_user!
        before_action :correct_user, only: [:show, :edit, :update, :destroy, :extend]
        # include API::V1::Defaults
        # resource :activities do
        #   desc "Return all activities"
        #   get "" do
        #     Activity.all
        #   end
        # desc "Return an activity"
        #   params do
        #     requires :id, type: String, desc: "ID of the activity"
        #   end
        #   get ":id" do
        #     Activity.where(id: permitted_params[:id]).first!
        #   end
        # end
        def index 
          activities = current_user.activities.order('created_at DESC');
          render json: {status: 'SUCCESS', message: 'Loaded activities', data: activities}, status: :ok
        end

        def show
          render json: {status: 'SUCCESS', message:'Loaded activity', data: @activity}, status: :ok
        end

        def create
          activity = current_user.activities.build(activity_params)
          if activity.save
            render json: {status: 'SUCCESS', message:'Saved activity', data: activity}, status: :ok
          else
            render json: {status: 'ERROR', message:'Activities not saved', data:activity.errors},status: :unprocessable_entity
          end
        end

        def destroy
          @activity.destroy
          render json: {status: 'SUCCESS', message:'Deleted activity', data:@activity},status: :ok
        end

        def update
          if @activity.update_attributes(activity_params)
            render json: {status: 'SUCCESS', message:'Updated activity', data:@activity},status: :ok
          else
            render json: {status: 'ERROR', message:'Activity not updated', data:@activity.errors},status: :unprocessable_entity
          end
        end

        def correct_user
          @activity = current_user.activities.find_by(id: params[:id])
          render json: {status: 'ERROR', message:'Not correct user'},status: :unprocessable_entity if @activity.nil? 
        end
      
        private
          def set_activity
            @activity = Activity.find(params[:id])
          end
          
          def activity_params
            params.permit(:user_id, :category_id, :start_time, :end_time, :name, :mastery, :pleasure, :comment)
          end
      end
    end
  end