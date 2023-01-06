class GoogleSheet
  # https://github.com/AndreyAzimov/ruby-on-rails-google-sheet-csv/blob/main/README.md

  require 'open-uri'
  require 'csv'

  def self.get url

    csv_file = "#{Rails.root}/public/data.csv"

    csv_with_headers = true

    open(url) {|f| File.open(csv_file,"wb") {|file| file.write f.read}}

    parsed_data = []

    CSV.open(csv_file, 'r:bom|utf-8', headers: csv_with_headers).each do |row|
      parsed_data << row.to_hash
    end

    return parsed_data
  end
end
