Factory.define :admin, :class => User do |account|
  account.phone_number "9000011221"
  account.name "John Doe"
  account.email "johndoe@gmail.com"
  account.password "p@ssw0rd"
  account.activated true
end

Factory.define :inactive_admin, :class => User, :parent => :admin do |account|
  account.activated false
end