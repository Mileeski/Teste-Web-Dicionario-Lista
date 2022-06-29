*** Settings ***
Documentation  Documetação da API: https://fakerestapi.azurewebsites.net/index.html
Library        RequestsLibrary
Library        Collections
Library    String

*** Variables ***
${URL}      https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}    id=15
...           title=Book 15
...           pageCount=1500

&{BOOK_9}     id=9
...           title=teste
...           description=teste
...           pageCount=200
...           excerpt=teste
...           publishDate=2022-06-22T23:22:51.42Z

&{BOOK_150}   id=150
...           title=teste alterado
...           description=teste alterado
...           pageCount=3
...           excerpt=teste alterado
...           publishDate=2022-06-22T23:22:51.42Z

*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL}
    ${HEADERS}    Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log         ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
 
Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
    Log         ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
cadastrar um novo livro
    ${RESPOSTA}    Post Request    fakeAPI    Books
    ...                            data={"id": 9, "title": "teste","description": "teste","pageCount": 200,"excerpt": "teste","publishDate": "2022-06-22T23:22:51.42Z"}
    ...                            headers=${HEADERS}               
    Log         ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Alterar o livro 150
    ${RESPOSTA}    Put Request    fakeAPI    Books/150
    ...                           data={"ID": 150,"Title": "teste alterado","Description": "teste alterado","PageCount": 3,"Excerpt": "teste alterado","PublishDate": "2022-06-22T23:22:51.42Z"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}


Excluir o livro 195
    ${RESPOSTA}    Delete Request    fakeAPI    Books/195
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings     ${REASON_DESEJADO}     ${REASON_DESEJADO}
conferir o status code
    [Arguments]    ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings    ${STATUS_CODE_DESEJADO}    ${STATUS_CODE_DESEJADO}
Conferir se retorna uma lista com 200 livros
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${REASON_DESEJADO}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QNTD_LIVRO}" livros
    Length Should Be    ${RESPOSTA.json()}    200

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id    ${BOOK_15.id} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title     ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount  ${BOOK_15.pageCount}
    Should Not Be Empty               ${RESPOSTA.json()["description"]}
    Should Not Be Empty               ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]} 

conferir se o livro ${ID_LIVRO} foi cadastrado
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK_9.id} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK_9.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK_9.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     ${BOOK_9.description} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         ${BOOK_9.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     ${BOOK_9.publishDate}


conferir se o livro ${ID_LIVRO} foi alterado
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK_150.id} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK_150.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK_150.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     ${BOOK_150.description} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         ${BOOK_150.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     ${BOOK_150.publishDate}


conferir se o livro 195 foi excluido
    Should Be Empty    ${Resposta.content}