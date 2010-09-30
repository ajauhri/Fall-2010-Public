# To change this template, choose Tools | Templates
# and open the template in the editor.

Factory.define :valid_user , :class => User do |u|
  u.sequence(:username) {|n| "user#{n}"}
  u.password "test"
  u.password_confirmation {|u| u.password} #This is called a block, and gives flexibility
  u.sequence(:email) { |n| "cmu#{n}@gmail.com" }
  #u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :invalid_user , :class => User do |u|
end