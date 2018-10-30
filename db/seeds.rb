# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Province.destroy_all
Tag.destroy_all

tagArray = ["paid", "processing", "fulfilled", "delivered", "canceled"]

provincesArray = [
                    ["Alberta","AB",0,5,0,"Canada"],
                    ["British Columbia","BC",7,5,0,"Canada"],
                    ["Manitoba","MB",8,5,0,"Canada"],
                    ["New-Brunswick","NB",0,0,15,"Canada"],
                    ["Newfoundland and Labrador","NL",0,0,15,"Canada"],
                    ["Northwest Territories","NT",0,5,0,"Canada"],
                    ["Nova Scotia","NS",0,0,15,"Canada"],
                    ["Nunavut","NU",0,5,0,"Canada"],
                    ["Ontario","ON",0,0,13,"Canada"],
                    ["Prince Edward Island","PE",0,0,15,"Canada"],
                    ["Québec","QC",9.975,5,0,"Canada"],
                    ["Saskatchewan","SK",6,5,0,"Canada"],
                    ["Yukon","YT",0,5,0,"Canada"]
                    
]

provincesArray.each do |prov|
    newProv = Province.new(:name => prov[0],
                            :acronyms => prov[1],
                            :PST => prov[2],
                            :GST => prov[3],
                            :HST => prov[4],
                            :country => prov[5])
    newProv.save!
    end

    tagArray.each do |tag|
        newTag = Tag.new(:name => tag)
        newTag.save!
    endAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?