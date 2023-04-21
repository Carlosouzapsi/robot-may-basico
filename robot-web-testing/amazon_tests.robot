*** Settings ***
Documentation  Essa suite testa o site da amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador
## Suite setup caso queira manipular a suite toda
## Suite teardown caso queira manipular a suite toda

## robot -d ./logs -t  'Caso de teste 01 - Acesso ao menu "Eletrônicos"' amazon_tests.robot 
*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse site verifica o menu eletronicos do site da amazon.com.br
    ...                E verifica categoria computadores e informática
    [Tags]             menus  categorias

    Acessar a home do site da Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o titulo da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparce a categoria "Computadores e Informática"

### robot -d ./logs -t  "Caso de teste 02 - Pesquisa de um Produto" amazon_tests.robot 
Caso de teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca

    Acessar a home do site da Amazon.com.br
    Digitar o nome de produto "Xbox series S" no campo de Pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"

# robot -L debug -d  ./logs -t "Caso de teste 03 - Adicionar Produto no Carrinho" amazon_tests.robot 
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Este teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho

    Acessar a home do site da Amazon.com.br
    Digitar o nome de produto "Xbox series S" no campo de Pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


    