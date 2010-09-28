# To change this template, choose Tools | Templates
# and open the template in the editor.

Factory.define :valid_user , :class => User do |u|
  u.username "mathieu"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu.rousseau.31@gmail.com"
  #u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :invalid_user , :class => User do |u|
end