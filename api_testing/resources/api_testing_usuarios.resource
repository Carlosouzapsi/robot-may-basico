*** Settings ***
Library  RequestsLibrary
Library  String
#### robot -d ./logs api_testing/tests/api_testing_usuarios.robot

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable  ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com
    Log  ${EMAIL_TESTE}
Cadastrar o usuário criado na ServeRest
    ${body}  Create Dictionary  
    ...      nome=Fulano da Silva  
    ...      email=${EMAIL_TESTE}
    ...      password=1234  
    ...      administrador=true
    Log      ${body}

    Criar Sessão no ServeRest
    ${resposta}  POST On Session 
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
      
    Log          ${resposta.json()}


Criar Sessão no ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=serveRest  url=https://Serverest.dev  headers=${headers}
