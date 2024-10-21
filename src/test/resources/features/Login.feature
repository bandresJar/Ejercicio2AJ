Feature: Login API Testing

  Background:
    * def baseUrl = 'https://api.demoblaze.com'
    * header 'content-type' = 'application/json'

  # 1. Usuario y password correcto en login
  Scenario: Usuario y password correcto en login
    Given url baseUrl + '/login'
    And request { "username": "and12and", "password": "cXlZZA==" }
    When method POST
    Then status 200
    And match response contains 'Auth_token'
    And print response

  # 2. Usuario incorrecto en login
  Scenario: Usuario y password incorrecto en login
    Given url baseUrl + '/login'
    And request { "username": "invalid_ussser", "password": "claveincorrecta" }
    When method POST
    Then status 200
    And match response.errorMessage == 'User does not exist.'
    And print response

  # 3. Usuario correcto y password incorrecto en login
  Scenario: Usuario correcto y password incorrecto en login
    Given url baseUrl + '/login'
    And request { "username": "and12and", "password": "claveincorrecta" }
    When method POST
    Then status 200
    And match response.errorMessage == 'Wrong password.'
    And print response
