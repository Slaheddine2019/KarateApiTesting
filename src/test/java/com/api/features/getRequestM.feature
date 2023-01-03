Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 

	
Scenario: to get all data from application JSon format 

	Given path '/normal/webapi/all'   
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200
	
	And print response
	
Scenario: to get all data from application JSon format 

	Given path '/normal/webapi/all'
	
	And header Accept = 'application/json' 
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200
	
	* def responseData = response
	* def actualId = responseData[0].jobId
	* def actualJobtitle = responseData[0].jobTitle
	
	* print actualId
	* match actualId == 1
	* match actualJobtitle == 'Software Engg'
	
	And print response
	
Scenario: to get all data from application XLM format 

	Given path '/normal/webapi/all'
	
	And header Accept = 'application/xml' 
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200
	
	And print response
	
 