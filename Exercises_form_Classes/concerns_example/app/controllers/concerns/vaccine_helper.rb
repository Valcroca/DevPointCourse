module VaccineHelper
  extend ActiveSupport::Concern

  def self.vaccine_names
    {
      'nfpa_vaccines' => ['Tetanus Vaccine', 'Seasonal Influenza'],
      'cdc_vaccines' => ['Hep A Vaccine', 'Typhoid Vaccine']
    }
  end
end