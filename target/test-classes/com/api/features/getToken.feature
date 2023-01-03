Feature: To get the JWT token for the user 
	POST https://jobapplicationjwt.herokuapp.com/users/sign-up

Scenario: Register the user and generate the token 
# Register the User
	Given url 'https://jobapplicationjwt.herokuapp.com/users/sign-up' 
	And headers {Accept:'application/json', Content-Type:'application/json'} 
	And request {username: 'John Wick',  password: 'Guns and Bikes' } 
	When method post 
	Then status 200 
	# Get the Token
	
Scenario: 
	Given url 'https://jobapplicationjwt.herokuapp.com/users/authenticate' 
	And headers {Accept:'application/json', Content-Type:'application/json'} 
	And request {   username: 'John Wick',  password: 'Guns and Bikes' } 
	When method post 
	Then status 200 
	* def authToken = response.token 
	
	And  print authToken 
	
Scenario: get request with token 
	* print tokenID 
	Given  header Authorization = 'Bearer ' + tokenID 
	And   url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all' 
	When  method get 
	Then  status 200
	And print response
	
	
	