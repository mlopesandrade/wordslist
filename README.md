# english_lists

Projeto Flutter para listar palavras em inglês.

## Getting Started

O projeto a ser desenvolvido por você tem como objetivo exibir termos em inglês e gerenciar as palavras visualizadas.

Projeto constitui:
 - O projeto esta configurado em dois idiomas: pt-Br e en-US
 - O projeto esta configurado para dois temas: light e dark
 - Tela de login para autenticação do usuario.
 - Tela de registro para o usuario se registrar.
 - Tela inicial onde o usuario tem um botão de seleçao para 3 paginas: Lista de palavras,Historico e favoritos.
 - Tela lista de palavras mostra uma lista detalhada de palavras constadas em um json.
 - Tela de historico para mostrar ao usuario seu historico de navegação nas palavras.
 - Tela de favoritos para mostrar ao usuario suas palavras marcadas como favoritas.
 - Tela de detalhes da palavra onde mostra ela, sua pronuncia, seus significados, e um play para poder ouvi-la em idioma americano.

Tecnologias utilizadas:
 - Firebase auth para autenticação.
 - Firebase Firestore para salvar historico e favoritos.
 - GetStorage para salvar localmente o tema.
 - Flutter native splash para gerenciar uma splashscreen nativa.
 - Getx para injeção de dependencias, gerenciamento de estado , chamadas http , rotas nomeadas, localização, traduções e para configurar temas e possiveis trocas de temas.
 - Progress state button para botão de efeito na tela de login.
 - flutter_tts para sintetizar a palavra em audio e toca-la na tela de detalhes.

Como rodar o projeto:
 - projeto gerado e trabalhado na versão flutter '3.10.5' ultima disponivel.
 - Rodar 'flutter pub get'.
 - e buildar a aplicação com 'flutter run' em emulador ou celular android ou ios.
