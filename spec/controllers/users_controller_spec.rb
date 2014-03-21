require 'spec_helper'

describe UsersController do

  login_user

  describe "GET 'show'" do

    it "finds the right user" do
      get :show, id: @user.id
      assigns(:user).should == @user
    end

    describe "use friendly_id for user slugs" do

      it "responds to its generated slug" do
        get :show, id: @user.slug
        response.should be_success
      end

      it "redirect when using user's id" do
        get :show, id: @user.id
        response.should redirect_to(user_path(@user))
      end

    end

    # it "should display the list of talks" do
    #   talk = FactoryGirl.create(:talk, speaker: @user)
    #   visit user_path(@user)
    #   page.should have_content(talk.title)
    # end

  end

end
