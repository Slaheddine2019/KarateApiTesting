Feature: To get the JWT token for the user 
	POST https://jobapplicationjwt.herokuapp.com/users/sign-up

Scenario: get request with token 
	* print tokenID 
	Given  header Authorization = 'Bearer ' + tokenID 
	And   url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all' 
	When  method get 
	Then  status 200
	And print response