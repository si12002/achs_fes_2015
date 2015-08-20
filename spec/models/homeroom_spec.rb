require 'spec_helper'

describe Homeroom do

	before do
    	@homeroom = Homeroom.new(shop_name: "seisho31shop", content: "nice", menu: "rice 100yen")
	end

	subject { @homeroom }

  	it { should respond_to(:users) }
  	it { should respond_to(:posts) }

end
