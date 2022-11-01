FactoryBot.define do
  # sequence(:email) do |n|
  #   "test#{n}@example.com"
  # end

  sequence :name do |n|
    "John Doe #{n}"
  end

  factory :user do
    name
    photo { "https://images.unsplash.com/photo-1649194791397-90dddfe2c1c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80" }
    # email
    # password { 'password' }
    # password_confirmation { 'password' }
    # confirmed_at { Date.today }
    bio { 'I am a user' }

    # factory :admin do
    #   role { 'admin' }
    # end

    factory :user_with_posts do
      transient do
        posts_count { 5 }
      end

      posts do
        Array.new(posts_counter) { association(:post) }
      end
    end
  end
end
