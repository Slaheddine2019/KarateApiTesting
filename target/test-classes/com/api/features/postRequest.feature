Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 

	
Scenario: to get all data from application JSon format 

	And path '/normal/webapi/add'
    And request {  "jobId": 129 ,"jobTitle":  'dfdfdfdf' , "jobDescription": ' dfdfdfdf', "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    
    
    
    
    Scenario: to get all data from application JSon format 

	And path '/normal/webapi/add'
    * def body =
    """
{  "jobId": 165 ,"jobTitle":  '135dfdfdfdf' , "jobDescription": ' dfdfdfd222f', "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
      """
      And request body
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    
    Scenario: to get all data from application JSon format 

	And path '/normal/webapi/add'
	
	* def entryBody = read( 'classpath:src/test/ressources/data/postEntryJson.json ')
  
    And request entryBody
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    
   
    