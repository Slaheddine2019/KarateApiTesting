Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 
   
   
   Scenario: to get all data from application JSon format with headers 1

   

    Given header  Connection = 'keep-alive'

	When path getPath 
	
	And method get
	
	Then status 200 
	
	And print response
	

	
Scenario: to get all data from application JSon format with headers 2

* def requestHeaders = { Content-Type : 'application/json' , Connection : 'keep-alive' } 

    Given  headers requestHeaders

	And path getPath   
	
	When method get
	
	Then status 200 
	
	And print response
	
	Scenario: to get all data from application JSon format with headers 3

* configure headers = { Content-Type : 'application/json' , Connection : 'keep-alive' } 

 	And path getPath   
	
	When method get
	
	Then status 200 
	
	And print response