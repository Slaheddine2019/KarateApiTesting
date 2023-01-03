Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 

 Scenario: to get all data from application JSon format 

	And path '/normal/webapi/add'
	
	* def entryBody = read( 'classpath:src/test/ressources/data/postEntryJson.json ')
  
    And request entryBody
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    
    Scenario: to get all data from application JSon format 

	Given path '/normal/webapi/update'
	
	And  call read ( 'postRequestToCall.feature' ) 
	
	* def updateBody = read( 'classpath:src/test/ressources/data/putEntry.json ')
  
    And request updateBody
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    And status 200
    And print response
    
    