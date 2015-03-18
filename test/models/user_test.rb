require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:jake)
  end
  
  test "Make sure user exists when created" do
    assert @user.valid?
  end
  
  test "name shouldn't be blank" do
    @user.name = '  '
    assert_not @user.valid?
  end
  
  test "email shouldn't be blank" do
    @user.email = '  '
    assert_not @user.valid?
  end
  
  test "name shouldn't be longer than 50 chars" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end
  
  test "email shouldn't be longer than 255 chars" do
    @user.email = 'a' * 255
    assert_not @user.valid?
  end
  
  test "email format should reject invalid email" do
    invalid_emails = ["foo@bar", "@bar.com", "foo@barcom", "foobarcom"]
    invalid_emails.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?
    end
  end
  
  test "email format should accept valid email" do
    valid_emails = ["foo@bar.com", "foo@bar.org", "longname1234@crazy.gov"]
    valid_emails.each do |valid|
      @user.email = valid
      assert @user.valid?
    end
  end
  
  test "password can't be blank" do
    
  end
  
  test "password can't be longer than 72 chars" do

  end
  
  test "password must match password confirmation" do

  end
end
