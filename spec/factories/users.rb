# To change this template, choose Tools | Templates
# and open the template in the editor.

Factory.define :valid_user , :class => User do |u|
  u.username "mathieu1"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.31@gmail.com"
end

Factory.define :invalid_user , :class => User do |u|
end

Factory.define :invalid_email , :class => User do |u|
  u.username "mathieu2"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.31gmail.com"
end

Factory.define :preexisting_username  , :class => User do |u|
  u.username "mathieu1"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau@gmail.com"
end

Factory.define :preexisting_email  , :class => User do |u|
  u.username "mathieu3"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.31@gmail.com"
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
