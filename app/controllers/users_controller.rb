class UsersController < ApplicationController
    
      def downgrade
        current_user.update_attribute(:role, 'standard')
        wikis = current_user.wikis
        wikis.each do |f|
        #for each loop to change all users wikis to public.
          f.private = false
          f.save!
        end
    
        flash[:notice] = "#{current_user.email} your account has been downgraded"
        redirect_to edit_user_registration_path
      end
    
    end