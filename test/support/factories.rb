
Factory.sequence(:name) {|n| "user_#{n}"}
Factory.sequence(:title) {|n| "title #{n}"}

Factory.define(:user) do |user|
  puts "CREATE USER!"
  user.name {Factory.next(:name)}
  user.login {|u| puts "USERNAME: #{u.name}"; "#{u.name}@plataformabooka.net" }
  user.password {|u| u.name }
  user.password_confirmation {|u| u.name }
end

Factory.define(:bok) do |bok|
  bok.title { Factory.next(:title) }
end

Factory.define(:site) do |site|
  puts "CREATE SITE!"
  site.title "Site"
  site.user {Factory.create(:user) }
end

Factory.define(:project) do |project|
  puts "CREATE PROJECT!"
  project.user {Factory.create(:user)}
  project.parent {|p| Factory.create(:site, :user => p.user) }
  project.sequence(:title) {|n| "project-#{n}"}
end
