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
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletronicos"
    verificar se aparece a frase "Eletronicos e Tecnologia"
    verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    verificar se aparece a categoria "Computadores e Informática"

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]  Esse teste verifica a busca de produto 
    [Tags]        Busca_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa
    Verificar o resultado da pesquisa se está listando o produto pesquisado

