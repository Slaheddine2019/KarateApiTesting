Feature: get all data in format json

  Background: setub base url
    Given url baseUrl

  Scenario: get all the data on format json
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response ==
      """
     [{"jobId":1,"jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":129,"jobTitle":"dfdfdfdf","jobDescription":" dfdfdfdf","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":165,"jobTitle":"135dfdfdfdf","jobDescription":" dfdfdfd222f","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":129,"jobTitle":"dfdfdfdf","jobDescription":" dfdfdfdf","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":165,"jobTitle":"135dfdfdfdf","jobDescription":" dfdfdfd222f","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":165,"jobTitle":"135dfdfdfdf","jobDescription":" dfdfdfd222f","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":129,"jobTitle":"dfdfdfdf","jobDescription":" dfdfdfdf","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":129,"jobTitle":"dfdfdfdf","jobDescription":" dfdfdfdf","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]},{"jobId":165,"jobTitle":"135dfdfdfdf","jobDescription":" dfdfdfd222f","experience":["Google","Apple","Mobile Iron","Google"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle","Jenkins"]}]}]
  {"jobId":1,"jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}

      """
    * def actualResponse = read("../data/allJsonData.json")
    And print "File ==> ", actualResponse
    And match response == actualResponse
    # contains
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep {"project":[{"projectName": "Movie App"}]}
    And match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'
    And match response.[0].jobId == '#present'
    And match response.[0].experience[1] == '#notnull'
    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].jobTitle == '#string'
    And match response.[0].jobId == '#number'
    # Complex Fuzzy matcher
    And match response.[0].jobId == '#? _ >= 1'
    And match response.[0].jobTitle == '#string? _.length == 13'
    # To validate the array
    And match response.[0].experience == '#[]'
    And match response.[0].experience == '#[3]'
    # Make sure it is a array of string
    And match response.[0].experience == '#[3] #string'
    And match response.[0].experience == '#[3] #string? _.length >= 2'

  Scenario: To get the data in XML format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    # Skip the response keyword
    And match /List/item/experience/experience[1] == 'Google'
    # Travers the xml similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'

  Scenario: To get the data in XML format and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience[1] == '#notnull'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[2] == '#ignore'
    And match response/List/item/jobTitle == '#string? _.length == 13'
    And match response/List/item/jobTitle.id == '#notpresent'
