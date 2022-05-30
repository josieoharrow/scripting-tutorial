#Open the data.txt file
file = File.open("data.txt")
#Read data.txt and store the contents in file_data
file_data = file.read.strip
#close data.txt
file.close

#replace all the spaces with an empty string!
no_spaces_data = file_data.gsub(/\s/, "")

#Make an output file called no-spaces-data.txt with writing enabled
no_spaces_out_file = File.new("no-spaces-data.txt", "w")
#Write the new string there
no_spaces_out_file.puts(no_spaces_data)
#close output file
no_spaces_out_file.close
