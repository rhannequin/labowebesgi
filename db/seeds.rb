puts '' # Blank line
puts 'FILL WITH SEEDS'

puts '  Create ROLES'
YAML.load(ENV['ROLES']).split(' ').each do |role|
  Role.find_or_create_by_name(role)
  puts '    role: ' << role
end

puts '  Create default USER with admin role'
admin = User.find_or_create_by_email  firstname: ENV['ADMIN_FIRSTNAME'].dup,
                                      lastname: ENV['ADMIN_LASTNAME'].dup,
                                      email: ENV['ADMIN_EMAIL'].dup,
                                      password: ENV['ADMIN_PASSWORD'].dup,
                                      password_confirmation: ENV['ADMIN_PASSWORD'].dup
puts '    user: ' << admin.full_name
admin.add_role :admin

puts '  Create default EVENT'
first_event = Event.create title: 'My First Event', starts_at: 3.days.from_now
puts '    event: ' << first_event.title

puts '  Add default TALK'
talk = Talk.create  title:       'Interesting talk',
                    description: 'Sample description.',
                    speaker:     admin,
                    event:       first_event,
                    tag_list:    'testing, ruby'
puts '    talk: ' << talk.title
