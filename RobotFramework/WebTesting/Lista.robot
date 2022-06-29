*** Settings ***
Documentation    Deve aparecer no log todos os meses do ano

*** Variables ***
@{meses}  Janeiro
...       Fevereiro
...       Março
...       Abril
...       Maio
...       Junho
...       Julho
...       Agosto
...       Setembro
...       Outubro
...       Novembro
...       Dezembro

*** Test Cases ***
Imprimir meses do ano 
    Log To Console    Mês 01: ${meses[0]}
    Log To Console    Mês 02: ${meses[1]}
    Log To Console    Mês 03: ${meses[2]}
    Log To Console    Mês 04: ${meses[3]}
    Log To Console    Mês 05: ${meses[4]}
    Log To Console    Mês 06: ${meses[5]}
    Log To Console    Mês 07: ${meses[6]}
    Log To Console    Mês 08: ${meses[7]}
    Log To Console    Mês 09: ${meses[8]}
    Log To Console    Mês 10: ${meses[9]}
    Log To Console    Mês 11: ${meses[10]}
    Log To Console    Mês 12: ${meses[11]}