*** Settings ***
Documentation    Deve aparecer no log todos os meses do ano

*** Variables ***
&{DIAS}   Janeiro=31
...       Fevereiro=28
...       Março=31
...       Abril=30
...       Maio=31
...       Junho=30
...       Julho=31
...       Agosto=31
...       Setembro=30
...       Outubro=31
...       Novembro=30
...       Dezembro=31

*** Test Cases ***
Imprimir quantos dias tem cada mês
    Log To Console    Janeiro tem ${DIAS.Janeiro} dias!
    Log To Console    Fevereiro tem ${DIAS.Fevereiro} dias!
    Log To Console    Março tem ${DIAS.Março} dias!
    Log To Console    Abril tem ${DIAS.Abril} dias!
    Log To Console    Maio tem ${DIAS.Maio} dias!
    Log To Console    Junho tem ${DIAS.Junho} dias!
    Log To Console    Julho tem ${DIAS.Julho} dias!
    Log To Console    Agosto tem ${DIAS.Agosto} dias!
    Log To Console    Setembro tem ${DIAS.Setembro} dias!
    Log To Console    Outubro tem ${DIAS.Outubro} dias!
    Log To Console    Novembro tem ${DIAS.Novembro} dias!
    Log To Console    Dezembro tem ${DIAS.Dezembro} dias!