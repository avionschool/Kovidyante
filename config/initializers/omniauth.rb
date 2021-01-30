Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['329772767369-bikbkum8h429ubukuchohu178j6cgiaq.apps.googleusercontent.com'], ENV['Gt04sB4dBTPBfOA21Cv66Jdd'], 
    {    access_type: "offline",
        prompt: "consent",
        select_account: true,
        scope: 'userinfo.email, calendar'
    }
  end