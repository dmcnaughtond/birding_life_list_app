require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test 'responds to name, email, subject and content' do
    msg = Message.new
    [:name, :email, :subject, :content].each do |attr|
      assert msg.respond_to? attr
    end
  end

  test 'should accept valid attributes' do
    valid_attrs = {
      name: 'Daffy',
      email: 'daffy@duck.com',
      subject: 'What\'s up, Duck?',
      content: 'kthnxbai'
    }

    msg = Message.new valid_attrs

    assert msg.valid?
  end

  test 'attributes cannot be blank' do
    msg = Message.new
    refute msg.valid?
  end
end
