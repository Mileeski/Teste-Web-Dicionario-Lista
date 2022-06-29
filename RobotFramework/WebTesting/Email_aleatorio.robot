*** Settings ***    
Library    String
*** Variables ***
&{PESSOA}    nome=Fernando    sobrenome=Mileski

*** Test Cases ***
Imprimindo email
    ${EMAIL_CRIADO}    Criar e-mail customizado e aleatório    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log To Console     ${EMAIL_CRIADO}

*** Keywords ***
Criar e-mail customizado e aleatório 
    [Arguments]       ${NOME}      ${SOBRENOME}
    ${ALEATORIA}       Generate Random String
    ${EMAIL_FINAL}    Set Variable      ${nome}${sobrenome}${ALEATORIA}@testerobot.com
    [Return]          ${EMAIL_FINAL}
    


