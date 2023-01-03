Feature: feature description 

Background: Setup Base url 

   Given  url baseUrl 

 Scenario: to get all data from application JSon format 
 * def idRemoved = 1255
  Given path '/normal/webapi/remove/'+ idRemoved
  
  When method delete
  
  Then status 200
   
   