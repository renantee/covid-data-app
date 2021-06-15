require "csv"
require "seed-fu"

# change these to match the seeded model
@csv_file = "db/fixtures/seed_vaccines.csv"
@output_file = "db/fixtures/seed_vaccines.rb"
@class_name = "Vaccine"

@seeds = CSV.read(@csv_file, headers: true)

SeedFu::Writer.write(@output_file.to_s, class_name:  @class_name.to_s,
                                        constraints: [:id]) do |writer|
  vaccine_array = []
  @seeds.each do |seed|
    next if vaccine_array.include? seed["vaccine_name"]

    hash = {}
    @seeds.headers.each do |header|
      if ["vaccine_name", "product_name", "company_name"].include?(header)
        hash[header.to_sym] = seed[header]
      end
    end

    writer.add(hash)
    vaccine_array.push(seed["vaccine_name"])
  end
end
