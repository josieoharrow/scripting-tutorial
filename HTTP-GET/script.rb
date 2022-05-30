#This is a comment. The "#" character means the computer doesn't get this part of the code. It's just for the 
#Programmer to use.

#I use comments to explain what is happening in the code for other coders to use. Here's an example:

#Load the needed libraries:
require 'net/http'
require 'csv'

#Now, for the rest of the code...

#Define a "method", or function, to be used for HTTP get with a text link.
def HTTPGetLink(url)

	#Convert the text into a URI object
	uri = URI(url)

	#Use the Net library to run HTTP get on the uri and capture the result in our variable "result"
	result = Net::HTTP.get(uri)
	
	#Return the result (a function need not return "anything", but this one does)
	return result

#State that it is the end of the method...
end

#Set the url link to ping
link = 'https://olis.oregonlegislature.gov/liz/committees/assignments/committee'

#run our function and print the result
p HTTPGetLink(link)

#Print "Try another URL?"
p "Try another URL? Type YES or hit ENTER to exit."

#Wait for the user to send input, and capture the result in a variable called "response"
response=gets

#Create a variable, clean_response, which is "response" with the newline characters removed.
clean_response = response.strip

#Check the response, and only run the code in our "if" statement if the response was "YES"
if clean_response.strip == "YES"
	
	p "What url?"
	#Get the response and remove the newline characters IN ONE STEP!
	link = gets.strip

	#Run the function again and print the result
	p HTTPGetLink(link)
end
