# SilvioWebEngine e SilvioWeb Browser

## Visão Geral

O **SilvioWebEngine** é um motor de renderização leve e modular, desenvolvido em C++ e Lua, projetado para renderizar conteúdo web moderno como HTML5 e CSS3. Ele serve como o coração do **SilvioWeb Browser**, um navegador web customizado que visa oferecer suporte a uma ampla gama de sistemas operacionais, desde os mais antigos como DOS e Windows 1.0, até os mais modernos como Linux e macOS.

### Funcionalidades do SilvioWebEngine

*   Renderização de **HTML5** puro.
*   Renderização de **CSS3** puro.
*   Carregamento e exibição de imagens nos formatos `.XBM`, `.XPM`, `.PNG`, `.JPG`, `.JPEG`.
*   Renderização de documentos **PDF**.
*   **Não** renderiza imagens no formato `.SVG`.

### Suporte a Plataformas

O projeto é ambicioso em seu suporte multiplataforma, visando compatibilidade com:

*   **DOS:** Executáveis de 16-bits (para 8086/8088/80286) e 32-bits (para 80386/80486/Pentium/Pentium-MMX/Pentium-2/Pentium-3/Pentium-4).
*   **Windows:** Versões antigas (1.0, 2.0, 3.0, 3.1, 3.11, 95, 98, 98SE, 2000, ME, XP, Vista, 7, 8, 8.1, 10, 11). Executáveis de 32-bits (Pentium-M/Celeron-M) e 64-bits (Core2Duo/Core2Quad/Core-i3/Ryzen/Core-Ultra).
*   **Linux:** Kernel 1.0 até 7.x, incluindo distribuições antigas como Slackware 1.0/2.0/3.0/4.0. Executáveis de 32-bits e 64-bits.
*   **macOS:** Versões antigas (1.1, 3.0, 4.2, 5.0, 6.0.4, 6.0.5, 7.0, 7.5.5, 8.0, 8.1, 8.5, 9.0, 9.1, 9.2, 9.2.2) e modernas (10.0 até 15/26). Suporte para arquiteturas m68k (Motorola 68000/010/020/030/040/060) com MacOS 8.0 (.appl) e 64-bits (PPC/PPC64/x86_32/x86_64/AArch64) com MacOS 8.0.

## Estrutura do Projeto

```
SilvioWebEngine/
├── src/                  # Código fonte (C++ e Lua)
│   ├── SilvioWebEngine.cpp
│   ├── silviowebengine.lua
│   └── silviowebbrowser.lua
├── include/              # Arquivos de cabeçalho C++
│   └── SilvioWebEngine.h
├── rockspecs/            # Especificação do pacote LuaRocks
│   └── Lua-SilvioWebEngine-v0.1-1.rockspec
├── docs/                 # Documentação
│   ├── README.md
│   ├── DEPENDENCIES.md
│   ├── INSTALL_AND_COMPILE.md
│   └── CODE.md
└── Makefile              # Script de compilação
```

## Como Contribuir

Contribuições são bem-vindas! Por favor, consulte o arquivo `CONTRIBUTING.md` (a ser criado) para diretrizes sobre como submeter pull requests, relatar bugs e sugerir melhorias.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo `LICENSE` (a ser criado) para mais detalhes.

## Autor

Manus AI (em nome do usuário Silvio)
