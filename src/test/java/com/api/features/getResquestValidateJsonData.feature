Feature: get response format json

 
Background: setup base url 

   Given  url 'http://localhost:9191' 
	

   Scenario: to get all data from application JSon format 
   
	Given  path '/normal/webapi/all' 
	
	And header Accept = 'application/json'
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200

	And match header Content-Type == 'application/json'
	And match header Connection == 'keep-alive'
	And match response.[0].jobId == 1
	And match response.[0].jobTitle == 'Software Engg';
	And match response.[0].jobDescription == 'To develop andriod application'
	And match response[0].experience[0] == 'Google'
	And match response[0].experience[1] == 'Apple'
	And match response[0].experience[2] == 'Mobile Iron'
	And match response[0].project[0].projectName == 'Movie App'
	And match response[0].project[0].technology[0] == 'Kotlin'
	And match response[0].project[0].technology[1] == 'SQL Lite'
    And match response[0].project[0].technology[2] == 'Gradle'
    And match response[0].experience[*] == ["Google","Apple","Mobile Iron"]
    And match response[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
    And match response[0].experience[*] contains ["Google","Apple","Mobile Iron"]
    And match response[0].project[0].technology[*] contains ["Kotlin","SQL Lite","Gradle"]
    And match response.[*].jobId contains 1
    
    Scenario: to get all data from application JSon format  and use fuzzy matcher
   
	Given  path '/normal/webapi/all' 
	
	And header Accept = 'application/json'
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200

	And match header Content-Type == 'application/json'
	And match header Connection == 'keep-alive'
	And match response.[0].jobId ==  '#present'
	And match response.[0].jobId ==  '#number'
	And match response.[0].jobTitle == '#notnull'
	And match response.[0].jobTitle == '#ignore'
	And match response.[0].jobTitle == '#string'
	And match response[0].experience == '#array'
	
	# complex fuzzy matcher
	And match response.[0].jobId ==  '#? _>= 1'
	And match response.[0].jobTitle == '#string? _.length == 13'
	
	
    