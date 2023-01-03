Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 

	
Scenario: to get all data from application JSon format 

* def query = {jobId : '1'}

	Given path getPath   
	
	And params  query
	
	When method get 
	
	Then status 200 
	
	
	
	Scenario: to get all data from application JSon format get the count

* def query = {jobId : '1'}

	Given path getPath   
	
	And params  query
	
	When method get 
	
	Then status 200 
	
	* def jsonresponse = response 
	
	* def jobTitle = jsonresponse[0].jobTitle.length
	
	* print jobTitle
	
	* match jobTitle == 13
	
	
	
	