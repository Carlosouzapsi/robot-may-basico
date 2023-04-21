*** Settings ***

Resource  ../resources/api_testing_usuarios.resource

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  ${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente
Cenário 02: Cadastrar um usuário já existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Vou Repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido

