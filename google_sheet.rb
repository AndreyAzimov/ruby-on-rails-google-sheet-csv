class GoogleSheet
  # Open Google Sheet
  # File -> Share -> Publish to the web
  # Entire Document -> Sheet1
  # Web page -> Comma-separated values (.csv)
  # Share
  # Copy that link that should look like this: https://docs.google.com/spreadsheets/d/e/2PACX-1vRfSXjhd7hDjagB7sX9CX1K7lDWJ6djduoILKoyZAYTWihbC8W336ZH-MtXIPNsulhy6sga/pubhtml?gid=0&single=true
  #
  # Usage GoogleSheet.get "https://docs.google.com/spreadsheets/d/e/2PACX-1vRfSXjhd7hDjagB7sX9CX1K7lDWJ6djduoILKoyZAYTWihbC8W336ZH-MtXIPNsulhy6sga/pubhtml?gid=0&single=true"

  require 'open-uri'
  require 'csv'

  def self.get url

    csv_file = "#{Rails.root}/public/data.csv"

    open(url) {|f| File.open(csv_file,"wb") {|file| file.write f.read}}

    parsed_data = []

    CSV.open(csv_file, 'r:bom|utf-8', headers: true).each do |row|
      parsed_data << row.to_hash
    end

    return parsed_data
  end
end
