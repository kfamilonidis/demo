# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'yaml'
include FactoryBot::Syntax::Methods

# yaml = YAML.load_file(Rails.root.join('db', 'test_data.yml'))
# p yaml

# user = create(:user)
post = Post.first

# 10.times { create(:comment, commentable: post) }
# create_list(:comment, 10, commentable: post) }

# User.delete_all
