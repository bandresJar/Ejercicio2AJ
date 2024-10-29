Feature: PetStore API Test
  Esta prueba se centra en probar la API de PetStore para realizar las siguientes acciones:
  - Añadir una mascota a la tienda
  - Consultar la mascota ingresada previamente (Búsqueda por ID)
  - Actualizar el nombre de la mascota y el estatus a "sold"
  - Consultar la mascota modificada por estatus (Búsqueda por estatus)

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header 'content-type' = 'application/json'

    * def userJson =
    """
    {
      "id": 0,
      "username": "TestAndres",
      "firstName": "Andres",
      "lastName": "UserPrueba",
      "email": "andres@gmail.com",
      "password": "pass1234",
      "phone": "123456789",
      "userStatus": 0
    }
    """

    * def petJson =
    """
    {
      "id": 30021001,
      "category": { "id": 0, "name": "DogiTest" },
      "name": "DogiTest",
      "photoUrls": ["https://sticker.ly/s/NSDULD"],
      "tags": [{ "id": 0, "name": "friendly" }],
      "status": "pruebaKarate"
    }
    """

    * def updatedPetJson =
    """
    {
      "id": 30021001,
      "category": { "id": 0, "name": "DogiTest" },
      "name": "TestPerrito",
      "photoUrls": ["https://sticker.ly/s/NSDULD"],
      "tags": [{ "id": 0, "name": "friendly" }],
      "status": "sold"
    }
    """

  Scenario: Crear y validar usuario
    Given path '/user'
    And request userJson
    When method POST
    Then status 200
    And match response.code == 200

    Given path '/user/', userJson.username
    When method GET
    Then status 200
    And match response.username == userJson.username

  Scenario: Login de usuario
    Given path '/user/login'
    And param username = userJson.username
    And param password = userJson.password
    When method GET
    Then status 200
    And match response.message contains 'logged in user session'

  Scenario: Agregar y validar mascota
    Given path '/pet'
    And request petJson
    When method POST
    Then status 200
    And match response.name == petJson.name
    And match response.status == petJson.status
    * def addedPetId = response.id

  Scenario: Buscar mascota por ID
    Given path '/pet/', petJson.id
    When method GET
    Then status 200
    And match response.name == petJson.name
    And match response.status == petJson.status

  Scenario: Modificar mascota
    Given path '/pet'
    And request updatedPetJson
    When method PUT
    Then status 200
    And match response.name == updatedPetJson.name
    And match response.status == updatedPetJson.status

  Scenario: Buscar mascotas por estatus
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    * def foundPet = karate.filter(response, function(pet) { return pet.id == petJson.id && pet.status == 'sold' })[0]
    * match foundPet.id == petJson.id
    * match foundPet.status == 'sold'
