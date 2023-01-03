Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 

	
Scenario: to get all data from application JSon format with autorisation 

	Given path '/secure/webapi/all'  
	  
	* configure headers = { Content-Type : 'application/json' , Connection : 'keep-alive' , Authorization : 'Basic YWRtaW46d2VsY29tZQ=='}
	
	When method get # send the get requests
	
	Then status 200 # the status code response should be 200
	
	And match response == '#notnull'
	
	And print response
	
	Scenario: to get all data from application JSon format without autorisation 

	Given path '/secure/webapi/all'  
	  
	* configure headers = { Content-Type : 'application/json' , Connection : 'keep-alive'}
	
	When method get 
	
	Then status 401
	
	And match response == '#notnull'
	
	And print response