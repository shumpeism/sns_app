# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
        # Use the existing token.
        File.read(token_file).chomp
        else
        # Generate a new token and store it in token_file.
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end

SnsApp::Application.config.secret_key_base = secure_token


#SnsApp::Application.config.secret_key_base = 'df49c3f7efc37dff2da8758821ab2c51cd5a234523922066f0ed109efb4eeb2f42df87f42ccae5f4f192411cebb687a54a03b3e5aa95c523d13af84fef1fe5b9'
