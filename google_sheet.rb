class GoogleSheet
  require 'open-uri'
  require 'csv'

  # https://github.com/AndreyAzimov/ruby-on-rails-google-sheet-csv/blob/main/README.md

  def self.get url

    csv_file = "#{Rails.root}/public/data.csv"

    csv_with_headers = true

    open(url) {|f| File.open(csv_file,"wb") {|file| file.write f.read}}

    data = []

    CSV.open(csv_file, 'r:bom|utf-8', headers: csv_with_headers).each{|row| data << row.to_hash}

    return data
  end
end
