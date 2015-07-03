require 'open-uri'


@path = 'http://tech-site.os.jp.oro.com/docs/education/csv-transfer/input.csv'

fileName = File.basename(@path)

open(fileName, 'wb') do |output|
  open(@path) do |data|
    output.write(data.read)
  end
end