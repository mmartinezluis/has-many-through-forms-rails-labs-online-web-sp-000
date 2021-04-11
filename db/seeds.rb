# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
    "Life",
    "Adventure",
    "Widsom",
    "Carrer",
    "Travel"
]

users = [
    "Joan",
    "Mark",
    "Mario",
    "Dasha",
    "Olieg"
]

posts= {
    "0" => {:title => "Titulo 1"},
    "1" => {:title => "Titulo 2"},
    "2" => {:title => "Titulo 3"},
    "3" => {:title => "Titulo 4"},
    "4" => {:title => "Titulo 5"}
}

comments= [
    "Comenatrio uno",
    "Comenatrio dos",
    "Comenatrio tres",
    "Comenatrio cuatro",
    "Comenatrio cinco",
]

def create_categories(categories)
  categories.collect do |category|
    Category.create(name: category)
  end
end

def create_users(users)
  users.collect do |user|
    User.create(username: user)
  end
end

def create_posts(posts)
  posts.collect do |key, value|
    Post.create(title: value[:title])
  end
end

def create_comments(comments)
  comments.collect do |comment|
    Comment.create(content: comment)
  end
end

def execute(categories, users, posts, comments)
  create_categories(categories)
  create_users(users)

  create_posts(posts).map.with_index do |post, index|
    post.categories << Category.all[index]
    post.save
  end

  create_comments(comments).map.with_index do |comment, index|
    comment.user = User.all[index]
    comment.post = Post.all[index]
    comment.save
  end

end

execute(categories, users, posts, comments)
