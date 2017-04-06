module MockedSpecHelper
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google_oauth2, {
      info: {
        :name => 'Testy McTesterson',
        :first_name => 'Testy',
        :last_name => 'McTesterson',
        :email => 'test@test.test',
        :password => 'testing01',
        :image => 'https://blog.xenproject.org/wp-content/uploads/2014/10/Testing.jpg'
      }
    })
  end

  def stub_email
    User.create!(
      first_name: "Tester",
      last_name: "Account",
      email: "tester.account@testing.test",
      password: "password01",
      image: 'https://blog.xenproject.org/wp-content/uploads/2014/10/Testing.jpg'
    )
  end

  def stub_admin
    User.create!(
      first_name: "Tester",
      last_name: "Account",
      email: "tester.account@testing.test",
      password: "password01",
      role: 'admin',
      image: 'https://blog.xenproject.org/wp-content/uploads/2014/10/Testing.jpg'
    )
  end
end
