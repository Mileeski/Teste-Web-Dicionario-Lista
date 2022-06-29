*** Settings ***
Documentation    aparecer no log apenas os itens desejados
Library    SeleniumLibrary
Library    String

*** Variables ***
@{NUMEROS}    0    1    2    3    4    5    6    7    8    9    10

*** Test Cases ***
Teste de imprimir apenas alguns números
    Imprimir se o número for 5 e 10

*** Keywords ***
Imprimir se o número for 5 e 10
    Log To Console    ${\n}
    
    FOR    ${numero}    IN    @{NUMEROS}
        IF    ${numero} == 5
            Log To Console    EU SOU O NÚMERO 5
        ELSE IF  ${numero} == 10
            Log To Console    EU SOU O NÚMERO 10
        ELSE           
            Log To Console    EU NÃO SOU O NÚMERO 5 E NEM !
        END
    END