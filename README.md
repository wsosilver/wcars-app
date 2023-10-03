WCars

App vitrine para loja de carros com painel administrativo


Requisitos
- Flutter 3

Instalação
 - Flutter pub get
 - flutter pub run build_runner watch --delete-conflicting-outputs

 Credenciais de primeiro acesso
 Usuario: wsilveira
 Senha:  123456

 - Observação
 Em anexo no email segue uma collection com as possiveis requisições.
 Cadastro de adm
 Listagem, Alteração, Cadastro e Exclusão de carros

Observação acessar o arquivo lib/data/remote/custom_dio.dart e alterar o ip que aponta para o backend local.
EX:. _dio.options.baseUrl = "http://192.168.0.8:3000/";

