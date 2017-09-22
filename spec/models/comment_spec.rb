require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:blog) }

  it { is_expected.to validate_presence_of(:comment_text) }
end
