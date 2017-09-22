require 'rails_helper'
require 'shoulda/matchers'
RSpec.describe Blog, type: :model do
  it "check the database table name" do
  	expect(Blog.table_name.to_s).to eq 'blogs'
  end

  it "Table name should not Blog" do
  	expect(Blog.table_name).not_to eq 'blog'
  end

  it { is_expected.to have_many(:comments) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:author) }
end
