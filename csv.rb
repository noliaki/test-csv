# require "open-uri"


# path
csv_path = "./input.csv"

def main(path)
  file_name = File.basename("output.txt")

  open(path) do |data|
    data_array = data.read.split(/\n/)
    data_array.each_index do |index|
      data_array[index] = data_array[index].split(/,/)
    end

    open(file_name, "w") do |output|
      data_array.transpose.each do |line|
        output.write(line.join(","))
        output.write("\n")
      end

      data_array.transpose[1..-1].each do |value|
        sums = 0
        value[1..-1].each do |amount|
          sums += amount.to_f
        end
        p value[0].to_s + "の合計は" + sums.to_s + "です"
        output.write("\n" + value[0].to_s + "の合計は" + sums.to_s + "です")
      end
    end
  end
end

main(csv_path)