require "csv"
require "seed-fu"

# change these to match the seeded model
@csv_file = "db/fixtures/seed_countries.csv"
@output_file = "db/fixtures/seed_countries.rb"
@class_name = "Country"

@seeds = CSV.read(@csv_file, headers: true)

SeedFu::Writer.write(@output_file.to_s, class_name:  @class_name.to_s,
                                        constraints: [:id]) do |writer|
  @seeds.each do |seed|
    hash = {}
    @seeds.headers.each do |header|
      hash[header.downcase.to_sym] = seed[header]
    end
    writer.add(hash)
  end
end
