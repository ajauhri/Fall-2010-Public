# To change this template, choose Tools | Templates
# and open the template in the editor.

Factory.define :valid_user , :class => User do |u|
  u.sequence(:username) {|n| "user#{n}"}
  u.password "test"
  u.password_confirmation {|u| u.password} #This is called a block, and gives flexibility
  u.sequence(:email) { |n| "cmu#{n}@gmail.com" }
  u.role "Admin"
  #u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :valid_user1 , :class => User do |u|
  u.username "mathieu77"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.99@gmail.com"
  u.role "Admin"
end

Factory.define :invalid_user , :class => User do |u|
end

Factory.define :invalid_email , :class => User do |u|
  u.username "mathieu2"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.31gmail.com"
end

Factory.define :nonmatching_password  , :class => User do |u|
  u.username "mathieu4"
  u.password "mathieu"
  u.password_confirmation "mathieu4"
  u.email "mathieu.rousseau.4@gmail.com"
end

Factory.define :invalid_username  , :class => User do |u|
  u.username "ma"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.77@gmail.com"
end
