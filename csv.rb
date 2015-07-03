# require "open-uri"


# path
csv_path = "./input.csv"

obj = {
  "test"=> [1,2,3,4,5,6,7,8,9]
}

p obj["test"]


def main(path)
  file_name = File.basename("output.txt")

  open(path) do |data|
    data_array = data.read.split(/\n/)
    data_array.each_index do |index|
      data_array[index] = data_array[index].split(/,/)
    end

    open(file_name, "w") do |output|
      data_array.transpose.each do |line|
        line.each do |value|
          output.write(value + ",")
        end
        output.write("\n")
      end
    end
  end
end

main(csv_path)