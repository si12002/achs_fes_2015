require 'spec_helper'

describe Post do
  let(:homeroom) { FactoryGirl.create(:homeroom) }
  before { @post = homeroom.posts.build(title: "foobar", content: "Lorem ipsum") }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:homeroom_id) }
  it { should respond_to(:homeroom) }
  its(:homeroom) { should eq homeroom }

  it { should be_valid }

  describe "when homeroom_id is not present" do
    before { @post.homeroom_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

end
