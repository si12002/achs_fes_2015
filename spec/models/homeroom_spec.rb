require 'spec_helper'

describe Homeroom do

	before do
    	@homeroom = Homeroom.new(shop_name: "seisho31shop", content: "nice", menu: "rice 100yen")
	end

	subject { @homeroom }

  it { should respond_to(:users) }
  it { should respond_to(:posts) }

  # Homeroom - user
  describe "profile page" do
    let(:homeroom) { FactoryGirl.create(:homeroom) }
    let!(:u1) { FactoryGirl.create(:user, homeroom: homeroom, shopname:"Foo", content: "fooooo", menu: "foobarbarbar") }
    let!(:u2) { FactoryGirl.create(:user, homeroom: homeroom, shopname:"Bar", content: "baaaar", menu: "foofoofoobar") }

    before { visit homeroom_path(homeroom) }

    # it { should have_content(homeroom.shop_name) }
    # it { should have_title(homeroom.shop_name) }

    describe "user" do
      # it { should have_content(u1.content) }
      # it { should have_content(u2.content) }
      # it { should have_content(user.microposts.count) }
    end
  end

  # Homeroom -< Post
  describe "profile page" do
    let(:homeroom) { FactoryGirl.create(:homeroom) }
    let!(:m1) { FactoryGirl.create(:post, homeroom: homeroom, title: "foo", content: "Foo") }
    let!(:m2) { FactoryGirl.create(:post, homeroom: homeroom, title: "bar", content: "Bar") }

  	before { visit homeroom_path(homeroom) }

  	#it { should have_content(homeroom.shop_name) }
  	#it { should have_title(homeroom.shop_name) }

  	describe "posts" do
    	it { should have_content(m1.title) }
  		it { should have_content(m1.content) }
   		it { should have_content(m2.title) }
     	it { should have_content(m2.content) }
    	it { should have_content(homeroom.posts.count) }
  	end
	end

  describe "post associations" do
    before { @homeroom.save }
    let!(:older_post) do
    	FactoryGirl.create(:post, homeroom: @homeroom, created_at: 1.day.ago)
    end
    let!(:newer_post) do
    	FactoryGirl.create(:post, homeroom: @homeroom, created_at: 1.hour.ago)
    end

    it "should have the right posts in the right order" do
    	expect(@homeroom.posts.to_a).to eq [newer_post, older_post]
    end

    it "should destroy associated posts" do
    	posts = @homeroom.posts.to_a
    	@homeroom.destroy
    	expect(posts).not_to be_empty
    	posts.each do |post|
      	expect(Post.where(id: post.id)).to be_empty
      end
    end
  end
end
