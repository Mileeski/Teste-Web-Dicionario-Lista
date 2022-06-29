*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]  Esse teste verifica o menu eletrônico do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]        Menus
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o texto "Eletronicos e Tecnologia" deve ser exibido na página
    E o titulo da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E a categoria "Computadores e Informática" deve ser exibida na página
   

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]  Esse teste verifica a busca de produto 
    [Tags]        Busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o titulo da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar produto no carrinho
    [Documentation]  Teste verifica adicionar o produto no carrinho
    [Tags]    Adicionar_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o titulo da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    E adiciono no carrinho

Caso de Teste 04 - Remover produto do carrinho
    [Documentation]  Teste verifica remover o produto no carrinho
    [Tags]    Remover_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S" 
    E adiciono no carrinho
    Então remover do carrinho

