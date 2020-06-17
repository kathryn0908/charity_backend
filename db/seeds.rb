# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Charity.destroy_all


    charities_url = ENV["URL"]
    response = RestClient.get(charities_url)
    charity_data = JSON.parse(response)
    charity_info = charity_data["data"]
    # byebug
    
    


charity_info.each do |charity|
    Charity.create(
        charity_name: charity["charityName"].titleize,
        url: charity["url"],
        donation_url: charity["donationUrl"],
        city: charity["city"].titleize,
        state: charity["state"],
        category: charity["category"]
    )
end


