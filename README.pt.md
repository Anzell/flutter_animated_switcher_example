[![English](https://img.shields.io/badge/Language-English-blue.svg)](./README.md)

# Exemplo de Tela Splash Animada no Flutter

Este projeto demonstra o uso do widget `AnimatedSwitcher` do Flutter para criar uma transição suave de uma tela de splash para a página inicial de um aplicativo.

## Recursos

- Tela de splash que é exibida enquanto o aplicativo está carregando.
- Transição animada da tela de splash para a página inicial.
- Página inicial que é exibida após o carregamento do aplicativo.

## Personalizações

Você pode personalizar a animação da tela de splash modificando a classe `SplashApp`.

## Começando

Para começar com este projeto, siga estas etapas:

1. Clone o repositório: `git clone https://github.com/anzell/flutter_splash_animation_example.git`
2. Navegue até o diretório do projeto: `cd flutter_splash_animation_example`
3. Instale as dependências: `flutter pub get`
4. Execute o aplicativo: `flutter run`

## Entendendo o Código

A principal parte deste projeto é a classe `SplashApp`, que é um `StatefulWidget`. Em seu estado, um `AnimationController` e uma `Animation` são criados. O `AnimationController` controla a duração da animação, e a `Animation` define o comportamento da animação.

O método `initState` da classe de estado inicia a animação quando o método Future contendo as dependências do aplicativo foi concluído. O método `build` retorna um widget `Stack` que contém uma tela de splash simples contendo FlutterLogo, e a página inicial. A página inicial é envolvida em um widget `AnimatedBuilder` que usa a `Animation` para criar uma transição de escala da tela de splash para a página inicial.
