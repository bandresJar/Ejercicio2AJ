Feature: Signup API Testing

  Background:
    * def baseUrl = 'https://api.demoblaze.com'
    * header 'content-type' = 'application/json'

  # 1. Crear un nuevo usuario
  Scenario: Crear un nuevo usuario en signup
    Given url baseUrl + '/signup'
    And request { "username": "new_user_1243ee", "password": "cXlZZA==" }
    When method POST
    Then status 200
    And print response

  # 2. Intentar crear un usuario ya existente
  Scenario: Intentar crear un usuario ya existente en signup
    Given url baseUrl + '/signup'
    And request { "username": "and12and", "password": "ZXhpc3Rlcg==" }
    When method POST
    Then status 200
    And match response.errorMessage == 'This user already exist.'
    And print response
