*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://www.amazon.com.br/
${Mais_vendidos}        //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${Header_Eletronicos}    //h1[contains(.,'Eletrônicos e Tecnologia')]
 

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${Mais_vendidos}

Entrar no menu "Eletronicos"
    Click Element    //i[contains(@class,'hm-icon nav-sprite')]
    Wait Until Element Is Visible    //b[contains(.,'Olá, Faça seu login')]
    Click Element    (//a[@class='hmenu-item hmenu-compressed-btn'][contains(.,'ver tudo')])[1]
    Wait Until Element Is Visible    //a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
    Click Element    //a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
    Wait Until Element Is Visible    //li[contains(.,'eletrônicos')]
    Click Element    //a[contains(.,'Tudo em Eletrônicos')]
    
verificar se aparece a frase "Eletronicos e Tecnologia"
    Wait Until Page Contains     text=Eletrônicos e Tecnologia
    Wait Until Element Is Visible    locator=${Header_Eletronicos}

verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de Pesquisa
    Input Text    //input[contains(@type,'text')]    text=${PRODUTO}

Clicar no botão de Pesquisa
    Click Button    //input[contains(@type,'submit')]

Verificar o resultado da pesquisa se está listando o produto pesquisado 
    Wait Until Element Is Visible   locator=//img[contains(@alt,'Console Xbox Series S')]

#GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletronicos"

Então o texto "Eletronicos e Tecnologia" deve ser exibido na página
    verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o titulo da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    verificar se aparece a frase "Eletronicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa

Então o titulo da página deve ficar "${TITULO}"
    verificar se o título da página fica "${TITULO}"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto pesquisado

E adiciono no carrinho
    Scroll Element Into View    locator=//span[@class='a-price-whole'][contains(.,'2.399,')]
    Wait Until Element Is Visible    locator=//span[@class='a-price-whole'][contains(.,'2.399,')]
    Click Element    locator=//img[contains(@alt,'Console Xbox Series S')]
    Wait Until Element Is Visible    locator=//span[@class='a-size-large product-title-word-break'][contains(.,'Console Xbox Series S')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
    Click Element    locator=//a[contains(.,'Ir para o carrinho')]
    Page Should Contain Image    locator=//img[contains(@alt,'Console Xbox Series S, Abre em uma nova aba')]

Quando procuro produto e adiciono no carrinho
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    E adiciono no carrinho

Então remover do carrinho
    Page Should Contain Image    locator=//img[contains(@alt,'Console Xbox Series S, Abre em uma nova aba')]
    Wait Until Element Is Visible    locator=//input[@value='Excluir']
    Click Element    locator=//input[@value='Excluir']
    Wait Until Element Is Visible    locator=//h1[contains(@class,'a-spacing-mini a-spacing-top-base')]