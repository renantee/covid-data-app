module Filterable
  extend ActiveSupport::Concern

  included do
    scope :filter_by_country, lambda { |country_ids|
      where country_id: country_ids.split(",")
    }
    scope :filter_by_data_source, lambda { |data_source|
      where data_source: data_source
    }
    scope :filter_by_date_updated_start_date, lambda { |date_updated_start_date|
      where "date_updated >= ?", date_updated_start_date
    }
    scope :filter_by_date_updated_end_date, lambda { |date_updated_end_date|
      where "date_updated <= ?", date_updated_end_date
    }
    scope :filter_by_first_vaccine_date_start, lambda { |first_vaccine_date_start|
      where "first_vaccine_date >= ?", first_vaccine_date_start
    }
    scope :filter_by_first_vaccine_date_end, lambda { |first_vaccine_date_end|
      where "first_vaccine_date <= ?", first_vaccine_date_end
    }
    scope :filter_by_vaccine, lambda { |vaccine_ids|
      where("EXISTS (:vaccination_details)",
            vaccination_details: VaccinationDetail.select("1")
              .where("vaccination_details.vaccination_id = vaccinations.id")
              .where(vaccine_id: vaccine_ids.split(",")))
    }
  end

  module ClassMethods
    def filter(filtering_params)
      results = where(nil) # create an anonymous scope
      filtering_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end
end
