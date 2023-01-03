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