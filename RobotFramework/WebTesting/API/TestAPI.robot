*** Settings ***
Documentation  Documetação da API: https://fakerestapi.azurewebsites.net/index.html
Suite Setup    Conectar a minha API
Resource    ResourceAPI.robot

*** Test Cases ***
Buscar a listagem de todos os livros(GET em todos os livros)
    Requisitar todos os livros
    Conferir o reason     OK
    conferir o status code  200
    Conferir se retorna uma lista com "200" livros

Buscar um livro especifico (GET em um livro específico)
    Requisitar o livro "15"
    Conferir o reason     OK
    conferir o status code  200
    Conferir se retorna todos os dados corretos do livro 15

Cadastrar um novo livro (POST)
    cadastrar um novo livro
    Conferir o reason     OK
    conferir o status code  200
    conferir se o livro 9 foi cadastrado

Alterar um livro (PUT)
    Alterar o livro 150
    Conferir o reason     OK
    conferir o status code  200
    conferir se o livro 150 foi alterado

Deletar um livro (DELETE)
    Excluir o livro 195
    Conferir o reason     OK
    conferir o status code  200
    conferir se o livro 195 foi excluido
    