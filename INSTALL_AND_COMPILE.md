# INSTALL_AND_COMPILE.md - Instalação e Compilação do SilvioWebEngine e SilvioWeb Browser

Este documento detalha os passos para instalar e compilar o SilvioWebEngine e o SilvioWeb Browser. Devido à natureza multiplataforma do projeto, as instruções são divididas para instalação via LuaRocks e compilação manual via Makefile, com considerações especiais para sistemas operacionais antigos.

## 1. Pré-requisitos

Antes de prosseguir com a instalação ou compilação, certifique-se de ter todas as dependências necessárias instaladas em seu sistema. Consulte o arquivo [DEPENDENCIES.md](DEPENDENCIES.md) para obter instruções detalhadas sobre como instalar as dependências para o seu sistema operacional.

Em resumo, você precisará de:

*   Um compilador C++ (GCC, Clang, MSVC, Open Watcom, etc., dependendo do seu sistema).
*   Lua e seus cabeçalhos de desenvolvimento.
*   Bibliotecas para manipulação de imagens (libpng, libjpeg, libxpm).
*   Bibliotecas para renderização de PDF (Poppler ou similar).

## 2. Instalação via LuaRocks (Recomendado para Sistemas Modernos)

O LuaRocks é o gerenciador de pacotes padrão para Lua. Ele simplifica a instalação de módulos Lua, incluindo aqueles com componentes C/C++.

1.  **Certifique-se de que o LuaRocks está instalado:**
    Se você não tiver o LuaRocks, instale-o seguindo as instruções em [https://luarocks.org/](https://luarocks.org/).

2.  **Navegue até o diretório `rockspecs` do projeto:**
    ```bash
    cd SilvioWebEngine/rockspecs
    ```

3.  **Instale o pacote usando o arquivo `.rockspec`:**
    ```bash
    luarocks install Lua-SilvioWebEngine-v0.1-1.rockspec
    ```
    Este comando tentará compilar o componente C++ do SilvioWebEngine e instalar os módulos Lua nos diretórios apropriados do LuaRocks.

    **Nota:** Se a compilação falhar, verifique se todas as dependências C/C++ estão corretamente instaladas e se o LuaRocks está configurado para encontrar seus cabeçalhos e bibliotecas Lua (você pode precisar definir variáveis de ambiente como `LUA_INCDIR` e `LUA_LIBDIR` ou usar flags de configuração do LuaRocks).

## 3. Compilação Manual via Makefile

Para maior controle sobre o processo de compilação, ou para sistemas onde o LuaRocks não é a opção ideal (especialmente sistemas mais antigos), você pode compilar o projeto manualmente usando o `Makefile` fornecido.

1.  **Navegue até o diretório raiz do projeto:**
    ```bash
    cd SilvioWebEngine
    ```

2.  **Compile o projeto:**
    Execute o comando `make` para compilar o motor de renderização C++ e preparar os arquivos Lua.
    ```bash
    make
    ```
    Isso criará a biblioteca compartilhada (ex: `libSilvioWebEngine.so` no Linux, `SilvioWebEngine.dll` no Windows, `libSilvioWebEngine.dylib` no macOS) no diretório `build/`.

    **Solução de Problemas de Compilação:**
    *   Se o `make` falhar, verifique as mensagens de erro. Elas geralmente indicarão dependências ausentes ou problemas de configuração do compilador.
    *   Consulte o [DEPENDENCIES.md](DEPENDENCIES.md) para garantir que todas as bibliotecas e ferramentas de desenvolvimento estejam instaladas.
    *   Você pode precisar editar o `Makefile` para ajustar os caminhos para os cabeçalhos e bibliotecas Lua (`LUA_INCLUDE_DIR`, `LUA_LIB_DIR`) ou para especificar um compilador diferente para sistemas muito antigos.

3.  **Instale o projeto (opcional):**
    Após a compilação bem-sucedida, você pode instalar os arquivos compilados nos diretórios padrão do sistema (definidos por `INSTALL_PREFIX` no Makefile).
    ```bash
    sudo make install
    ```
    Este comando copiará a biblioteca C++ para `$(INSTALL_LIB_DIR)`, os módulos Lua para `$(INSTALL_LUA_DIR)` e o executável do navegador para `$(INSTALL_BIN_DIR)`.

## 4. Executando o SilvioWeb Browser

Após a instalação (via LuaRocks ou `make install`), você pode executar o navegador:

```bash
SilvioWebBrowser
```

Se você compilou manualmente e não instalou, pode precisar executar o script Lua diretamente e garantir que a biblioteca C++ esteja no `LUA_CPATH` ou no caminho de biblioteca do sistema:

```bash
lua src/silviowebbrowser.lua
```

## 5. Considerações para Sistemas Operacionais Antigos

Para sistemas operacionais muito antigos (DOS, Windows 1.x-XP, Linux Kernel 1.x, macOS m68k/PPC), a compilação e instalação são significativamente mais complexas e não podem ser totalmente automatizadas por este `Makefile` genérico.

*   **Compiladores:** Você precisará de compiladores específicos para a arquitetura e o sistema operacional (ex: Open Watcom para DOS, versões antigas do GCC, CodeWarrior).
*   **Bibliotecas:** Encontrar e configurar versões compatíveis das bibliotecas Lua, imagem e PDF para esses ambientes é um desafio.
*   **Compilação Cruzada:** A abordagem mais prática é geralmente a compilação cruzada, onde você usa um sistema moderno para gerar executáveis para as plataformas antigas.

Para essas plataformas, o `Makefile` fornecido serve como um ponto de partida conceitual. A implementação real exigiria um esforço considerável de engenharia de build e scripts de configuração específicos para cada ambiente alvo. Consulte o [DEPENDENCIES.md](DEPENDENCIES.md) para mais informações sobre as complexidades de suporte a sistemas antigos.
