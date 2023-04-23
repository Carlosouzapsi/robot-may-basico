*** Settings ***
Library  RequestsLibrary
Library    String
Library    Collections
#### robot -d ./logs api_testing/tests/api_testing_usuarios.robot

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com
    Log  ${EMAIL_TESTE}
Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}      Create Dictionary  
    ...          nome=Fulano da Silva  
    ...          email=${email}
    ...          password=1234  
    ...          administrador=true
    Log          ${body}

    Criar Sessão no ServeRest
    ${resposta}  POST On Session 
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
      
    Log          ${resposta.json()}
    Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    Set Test Variable    ${RESPOSTA}  ${resposta.json()}


Criar Sessão no ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=serveRest  url=https://Serverest.dev  headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item  ${RESPOSTA}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}    _id

Vou Repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest  ${EMAIL_TESTE}  status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item  ${RESPOSTA}  message  Este email já está sendo usado
Consultar os dados do novo usuário
 ${resposta_consulta}  GET On Session  alias=ServeRest  url=/usuarios/${ID_USUARIO}
