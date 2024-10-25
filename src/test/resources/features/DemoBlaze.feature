Feature: DemoBlaze API Testing

  # Define base URL as una variable para reutilizar
  Background:
    * def baseUrl = 'https://api.demoblaze.com'
    * header 'content-type' = 'application/json'

  Scenario: Crear un nuevo usuario en signup
    Given url baseUrl + '/signup'
    And request { "username": "and12and32", "password": "cXlZZA==" }
    When method POST
    Then status 200
    And print response

  Scenario: Intentar crear un usuario ya existente en signup
    Given url baseUrl + '/signup'
    And request { "username": "usuario_existente", "password": "ZXhpc3Rlcg==" }
    When method POST
    Then status 200
    And match response.errorMessage == 'This user already exist.'
    And print response


  Scenario: Usuario y password correcto en login
    Given url baseUrl + '/login'
    And request { "username": "and12and", "password": "cXlZZA==" }
    When method POST
    Then status 200
    And match response contains 'Auth_token'
    And print response

  # 4. Usuario incorrecto en login
  Scenario: Usuario y password incorrecto en login
    Given url baseUrl + '/login'
    And request { "username": "and12and899898", "password": "claveincorrecta" }
    When method POST
    Then status 200
    And match response.errorMessage == 'User does not exist.'
    And print response



     # 4. Usuario correcto y passwprd incorrecto en login
  Scenario: Usuario y password incorrecto en login
    Given url baseUrl + '/login'
    And request { "username": "and12and", "password": "claveincorrecta" }
    When method POST
    Then status 200
    And match response.errorMessage == 'Wrong password.'
    And print response
