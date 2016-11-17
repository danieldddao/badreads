require 'spec_helper'
require 'rails_helper'

describe RolesController do
    describe 'showing roles form' do
        fixtures :roles
        it 'should show all roles and render template' do
          controller.instance_variable_set(:@current_user, User.new(:id => 1)) 
          get :new, params: {}
          expect(response).to render_template("new")
          expect(assigns(:roles).count).to eq(Role.all.count)
        end
    end
  
    describe 'creating new roles' do
        fixtures :roles
        it 'should create new role and redirect to roles form' do
          post :create, params: {:role => {:position => "Admin"}}
          expect(response).to redirect_to(new_staff_admin_path)
        end
        it 'should render template if failed creating new role' do
          fake_role = [double('Role')]
          allow(Role).to receive(:new).and_return(fake_role[0])
          allow(fake_role[0]).to receive(:save).and_return (false)
          post :create, params: {:role => {:position => "Admin"}}
          expect(response).to render_template("new")
        end
    end
end