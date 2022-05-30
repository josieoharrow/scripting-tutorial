require 'date'

val_threshold = ARGV[0].to_i

text = File.open("salaries.txt").read
arr = text.split("Name")

total_over = 0

for i in 1..arr.length-1
	
	arr2 = arr[i].split("Job Orgn")

	for j in 1..arr2.length - 1
		job_data = arr2[j]
		match_data = job_data.match(/Appt\sEnd\sDate:\s\d+-[A-Z]+-\d+/)
		if match_data
			#Check if earlier
			date = Date.strptime(match_data[0], "Appt End Date: %d-%b-%Y")
			if date > Date.today
				#Still active
				salary = job_data.match(/Annual\sSalary\sRate:\s(\d\d\d\d*)/)
				if salary
					sal = salary.captures[0]
					if sal.to_i > val_threshold
						total_over = total_over + (sal.to_i - val_threshold)
					end
				end
			end
		else
			#still active
			salary = job_data.match(/Annual\sSalary\sRate:\s(\d\d\d\d*)/)
			if salary
				sal = salary.captures[0]
				if sal.to_i > val_threshold
					total_over = total_over + (sal.to_i - val_threshold)
				end
			end
		end
	end
end

p "Total over: " + total_over.to_s
