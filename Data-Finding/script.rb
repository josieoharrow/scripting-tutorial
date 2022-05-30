file = File.open("data.txt")

file_data = file.read.strip

love_matches = file_data.scan(/love\s(\w+)/)
p love_matches

file.close
