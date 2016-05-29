Rails.application.config.middleware.use OmniAuth::Builder do 


provider :facebook, 'YOUR_APP_ID', 'YOUR_SECRET_KEY', 
           {:scope => 'PERMISSION_1, PERMISSION_2, PERMISSION_3...', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}

       end