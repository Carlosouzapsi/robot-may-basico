*** Settings ***
Library  SeleniumLibrary
Resource  ./amazon_resources.robot

## Bloco usado para variáveis constantes, n ocorre mudança nos values
*** Variables ***
${URL}  http://www.amazon.com.br
${MENU_ELETRONICOS}    a[href*='/Eletronicos']
${HEADER_ELETRONICOS}  //h1[contains(text(), 'Eletrônicos e Tecnologia')]
*** Keywords ***
Abrir o navegador
    Open Browser  browser=chrome 
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
    
Acessar a home do site da Amazon.com.br
    Go To  url=${URL}
    Wait Until Element is Visible  css=${MENU_ELETRONICOS}
Entrar no menu "Eletrônicos"
    Click Element  css=${MENU_ELETRONICOS}
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains          text=${FRASE}
    Wait Until Element is Visible     locator=${HEADER_ELETRONICOS}

Verificar se o titulo da página fica "${TITULO}"
    Title Should Be   title=${TITULO}

Verificar se aparce a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible  locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de Pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[1]

Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element is Visible   locator=//span[contains(.,'${PRODUTO}')]
    Click Element    locator=//img[contains(@alt, '${PRODUTO}')]
    Wait Until Element Is Visible    id=add-to-cart-button
    Click Element                    id=add-to-cart-button
Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element is Visible  id=NATC_SMART_WAGON_CONF_MSG_SUCCESS
    Page Should Contain    text=Adicionado ao carrinho
    

    





## GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home do site da Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o titulo da página fica "Eletrônicos e Tecnologia | Amazon.com.br" 
    
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparce a categoria "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparce a categoria "Computadores e Informática"
    

    
