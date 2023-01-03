Feature: get response format json 


Background: setup base url 

	Given  url 'http://localhost:9191' 
	
	
Scenario: to get all data from application xml format 

	Given  path '/normal/webapi/all' 
	
	And header Accept = 'application/xml' 
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200
	
	And print response 
	
	And match response/List/item/jobId == '1' 
	And match response/List/item/jobTitle == 'Software Engg' 
	And match response/List/item/jobDescription == 'To develop andriod application' 
	And match response/List/item/experience/experience[1] == 'Google'
	And match response/List/item/experience/experience[2] == 'Apple'
	And match response/List/item/experience/experience[3] == 'Mobile Iron' 
	And match response/List/item/project/project/projectName == 'Movie App' 
	And match response/List/item/project/project/technology/technology[1] == 'Kotlin' 
	And match response/List/item/project/project/technology/technology[2] == 'SQL Lite' 
#	# json travel
#	
#	And match response.List.item.jobTitle == 'Software Engg'
#	And match response.List.item.jobDescription == 'To develop andriod application' 
#	# and use fuzzy matcher
#	And match response/List/item/jobId == '#notnull' 
#	And match response/List/item/jobId == '#present' 
#	And match response/List/item/jobTitle == '#string'  
#	And match response/List/item/experience/experience == '#array'
#	
#	
#	#fuzzy matcher
#	
#	And match response/List/item/jobId == '#? _== 1' 
#	And match response/List/item/jobTitle == '#string? _.length == 13 '
#	