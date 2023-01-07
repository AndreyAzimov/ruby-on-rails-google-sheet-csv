class GoogleSheet
  require 'open-uri'
  require 'csv'

  def self.get url

    csv_file = "#{Rails.root}/public/data.csv"
    
    # save csv file from url
    open(url) {|f| File.open(csv_file,"wb") {|file| file.write f.read}}

    data = []
  
    # parse each csv row
    CSV.open(csv_file, headers: true).each{|row| data << row.to_hash}

    return data
  end
end
