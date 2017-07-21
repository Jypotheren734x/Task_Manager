# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
File.open('db/user_list.txt', 'w') do |f|
  user_list = []
  for i in 0...100 do
    password = Faker::Internet.password(8)
    user = User.create(first_name: Faker::Name.first_name,
                       last_name: Faker::Name.last_name,
                       email: Faker::Internet.safe_email,
                       password: password,
                       birthday: Faker::Date.birthday,
                       username: Faker::Internet.user_name)
    user.confirm
    number_of_tasks = rand(20..30)
    number_of_groups = rand(0..5)
    p "Building User #{i.to_s}: " + user.full_name
    progressbar = ProgressBar.create(title: 'Creating ' + number_of_tasks.to_s + ' Tasks', total: number_of_tasks, length: 150, format: '%t |%b%i| %p%% %e')
    for j in 0...number_of_tasks
      user.tasks.create(
        title: Faker::Hacker.verb + ' ' + Faker::Hacker.noun,
        description: Faker::Lorem.sentence,
        priority: Faker::Number.between(0, 5),
        completed: Faker::Boolean.boolean(0.5)
      )
      progressbar.increment
    end
    progressbar = ProgressBar.create(title: 'Creating ' + number_of_groups.to_s + ' Groups', total: number_of_groups, length: 150, format: '%t |%b%i| %p%% %e')
    for j in 0...number_of_groups
      user.owned_groups.create(
        title: Faker::Team.name,
        description: Faker::Lorem.paragraph,
        owner_id: user.id
      )
      progressbar.increment
    end
    user.owned_groups.each do |group|
      number_of_projects = rand(0..5)
      progressbar = ProgressBar.create(title: 'Creating ' + number_of_projects.to_s + ' Projects for: ' + group.title, total: number_of_projects, length: 150, format: '%t |%b%i| %p%% %e')
      for j in 0...number_of_projects
        project = group.projects.create(
          title: Faker::Company.buzzword,
          description: Faker::Lorem.paragraph,
          group_id: group.id
        )
        progressbar.increment
      end
    end
    user_list.push(email: user.email,username: user.username, password: password, tasks: user.tasks.count, groups: user.owned_groups.count)
    p user.full_name + ' Built'
    p '----------------------------------------------------------------------------------------------------------------------------'
  end
  f.puts Hirb::Helpers::AutoTable.render(user_list)
end
