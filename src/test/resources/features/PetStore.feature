Feature: PetStore API Test
  Esta prueba se centra en probar la API de PetStore para realizar las siguientes acciones:
  - Añadir una mascota a la tienda
  - Consultar la mascota ingresada previamente (Búsqueda por ID)
  - Actualizar el nombre de la mascota y el estatus a "sold"
  - Consultar la mascota modificada por estatus (Búsqueda por estatus)

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header 'content-type' = 'application/json'

    * def userJson = read('../data/user.json')
    * def petJson = read('../data/pet.json')
    * def updatedPetJson = read('../data/updatedPet.json')
    * def expectedUserResponse = read('../data/expectedUserResponse.json')
    * def expectedLoginResponse = read('../data/expectedLoginResponse.json')
    * def expectedPetResponse = read('../data/expectedPetResponse.json')
    * def expectedUpdatedPetResponse = read('../data/expectedUpdatedPetResponse.json')

  Scenario: Crear y validar usuario
    Given path '/user'
    And request userJson
    When method POST
    Then status 200
    And match response.code == 200

    Given path '/user/', userJson.username
    When method GET
    Then status 200
    And match response == expectedUserResponse

  Scenario: Login de usuario
    Given path '/user/login'
    And param username = userJson.username
    And param password = userJson.password
    When method GET
    Then status 200
    And match response == expectedLoginResponse

  Scenario: Agregar y validar mascota
    Given path '/pet'
    And request petJson
    When method POST
    Then status 200
    And match response.name == petJson.name
    And match response.status == petJson.status
    * def addedPetId = response.id
    And match response == expectedPetResponse

  Scenario: Buscar mascota por ID
    Given path '/pet/', petJson.id
    When method GET
    Then status 200
    And match response.name == expectedPetResponse.name
    And match response.status == expectedPetResponse.status
    And match response == expectedPetResponse

  Scenario: Modificar mascota
    Given path '/pet'
    And request updatedPetJson
    When method PUT
    Then status 200
    And match response.name == expectedUpdatedPetResponse.name
    And match response.status == expectedUpdatedPetResponse.status
    And match response == expectedUpdatedPetResponse

  Scenario: Buscar mascotas por estatus
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    * def foundPet = karate.filter(response, function(pet) { return pet.id == petJson.id && pet.status == 'sold' })[0]
    * match foundPet.id == petJson.id
    * match foundPet.status == 'sold'
