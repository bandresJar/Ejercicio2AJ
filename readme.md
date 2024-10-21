# Instrucciones para la ejecución del proyecto

Este proyecto de prueba automatizada utiliza Karate para probar los servicios REST de la página DemoBlaze (https://www.demoblaze.com) relacionados con el registro (signup) y el inicio de sesión (login).

## Requisitos previos:
1. Tener instalado **Java JDK 8** o superior.
2. Tener instalado **Gradle**.
3. Tener instalado **IntelliJ IDEA** o un editor de tu preferencia.
4. Asegurarse de tener acceso a internet para las pruebas contra la API.

## Pasos para la configuración y ejecución:

### 1. Clonar el repositorio:
   - Clona este proyecto desde tu repositorio o directorio de trabajo local.

### 2. Configurar Gradle:
   - Si no está configurado, asegúrate de tener **Gradle** instalado en tu sistema. Puedes verificarlo ejecutando el siguiente comando en la terminal:


### 3. Abrir el proyecto en IntelliJ:
   - Abre el proyecto en **IntelliJ** seleccionando el directorio raíz del proyecto.

### 4. Estructura del proyecto:
   - **src/test/java/karate/demo**: Contiene los runners de prueba que ejecutan los tests de Karate.
   - **src/test/resources/features**: Contiene  archivos `.feature` donde se definen los escenarios de prueba para los endpoints de la API.
   - **build.gradle**: Archivo de configuración de Gradle.
   --Las clases DemoBlaze contiene el codigo general para todas las pruebas
   --La clase TestSuite fue creada para realizar pruebas en orden en caso de ser necesario

### 5. Ejecución de las pruebas:
   - Para ejecutar las pruebas desde la terminal, navega al directorio raíz del proyecto y ejecuta el siguiente comando:
     ```
     gradle test o ./gradlew clean test
     ```

### 6. Resultados:
   - Los resultados de las pruebas se generarán en formato HTML en el directorio `build/reports/tests/test/index.html`.

### 7. Instrucciones adicionales:
   - Si deseas ejecutar las pruebas desde IntelliJ IDEA, simplemente se abre el archivo de prueba a probar, por ejemplo `LoginTest.java` y ejecuta el test directamente desde el editor usando el botón de "Run".
   - En las feature DemoBlaze y SignUp se debe cambiar el username por uno nuevo en cada ejecución
