# DEPENDENCIES.md - Dependências do SilvioWebEngine e SilvioWeb Browser

Este documento lista as dependências necessárias para compilar e executar o SilvioWebEngine e o SilvioWeb Browser em diferentes sistemas operacionais. Dada a vasta gama de plataformas suportadas, as instruções são generalizadas e podem exigir ajustes específicos para versões muito antigas ou configurações personalizadas.

## Dependências Principais

1.  **Compilador C++:** Necessário para compilar o motor de renderização (SilvioWebEngine).
2.  **Lua:** A linguagem de script para o binding e o navegador.
3.  **Bibliotecas de Imagem:** Para carregar e decodificar `.XBM`, `.XPM`, `.PNG`, `.JPG`, `.JPEG`.
4.  **Bibliotecas de PDF:** Para renderizar documentos `.PDF`.

## Instalação por Sistema Operacional

### Linux (Moderno - Debian/Ubuntu, Fedora/CentOS, Arch Linux)

Para sistemas Linux modernos, você pode usar o gerenciador de pacotes da sua distribuição.

*   **Compilador C++ (GCC/Clang):**
    *   **Debian/Ubuntu:**
        ```bash
        sudo apt update
        sudo apt install build-essential
        ```
    *   **Fedora/CentOS:**
        ```bash
        sudo dnf install gcc-c++
        ```
    *   **Arch Linux:**
        ```bash
        sudo pacman -S base-devel
        ```

*   **Lua (e cabeçalhos de desenvolvimento):**
    *   **Debian/Ubuntu:**
        ```bash
        sudo apt install lua5.4 liblua5.4-dev
        ```
    *   **Fedora/CentOS:**
        ```bash
        sudo dnf install lua lua-devel
        ```
    *   **Arch Linux:**
        ```bash
        sudo pacman -S lua
        ```

*   **Bibliotecas de Imagem (Ex: libpng, libjpeg, libxpm):**
    *   **Debian/Ubuntu:**
        ```bash
        sudo apt install libpng-dev libjpeg-dev libxpm-dev
        ```
    *   **Fedora/CentOS:**
        ```bash
        sudo dnf install libpng-devel libjpeg-turbo-devel libXpm-devel
        ```
    *   **Arch Linux:**
        ```bash
        sudo pacman -S libpng libjpeg-turbo libxpm
        ```

*   **Bibliotecas de PDF (Ex: Poppler):**
    *   **Debian/Ubuntu:**
        ```bash
        sudo apt install libpoppler-dev
        ```
    *   **Fedora/CentOS:**
        ```bash
        sudo dnf install poppler-devel
        ```
    *   **Arch Linux:**
        ```bash
        sudo pacman -S poppler
        ```

### Windows (Moderno - via MinGW/MSYS2 ou Visual Studio)

Para Windows, é recomendado usar um ambiente de desenvolvimento como MinGW/MSYS2 para compilação via Makefile, ou Visual Studio para um ambiente mais integrado.

*   **MinGW/MSYS2 (Recomendado para Makefile):**
    1.  Baixe e instale o MSYS2: [https://www.msys2.org/](https://www.msys2.org/)
    2.  Abra o terminal MSYS2 e instale as ferramentas de desenvolvimento:
        ```bash
        pacman -Syu
        pacman -S --needed base-devel mingw-w64-x86_64-toolchain
        ```
    3.  Instale Lua e bibliotecas de imagem/PDF (pode ser necessário compilar algumas manualmente ou encontrar pacotes pré-compilados):
        ```bash
        pacman -S mingw-w64-x86_64-lua mingw-w64-x86_64-libpng mingw-w64-x86_64-libjpeg-turbo mingw-w64-x86_64-poppler
        ```

*   **Visual Studio (Alternativa):**
    1.  Baixe e instale o Visual Studio com o pacote de desenvolvimento C++ para desktop.
    2.  Você precisará configurar o projeto para usar as bibliotecas Lua, imagem e PDF, que podem ser obtidas via vcpkg ou instaladas manualmente.

### macOS (Moderno - via Homebrew/MacPorts)

Para macOS moderno, use gerenciadores de pacotes como Homebrew ou MacPorts.

*   **Homebrew (Recomendado):**
    1.  Instale o Homebrew: [https://brew.sh/](https://brew.sh/)
    2.  Instale as dependências:
        ```bash
        brew install gcc lua libpng jpeg libxpm poppler
        ```

*   **MacPorts (Alternativa):**
    1.  Instale o MacPorts: [https://www.macports.org/](https://www.macports.org/)
    2.  Instale as dependências:
        ```bash
        sudo port install gcc lua libpng jpeg libxpm poppler
        ```

### Sistemas Operacionais Antigos (DOS, Windows 1.x-XP, Linux Kernel 1.x, macOS m68k/PPC)

O suporte a sistemas operacionais antigos é significativamente mais complexo e geralmente requer:

*   **Compiladores Específicos:** Compiladores como Open Watcom, Borland C++, DJGPP para DOS; versões antigas do Visual C++ ou GCC para Windows/Linux; CodeWarrior ou versões específicas do GCC para macOS m68k/PPC.
*   **Versões Antigas de Bibliotecas:** Encontrar e compilar versões compatíveis de Lua, libpng, libjpeg, etc., para esses ambientes.
*   **Ferramentas de Desenvolvimento Legadas:** Configurar ambientes de desenvolvimento que podem não ser mais suportados ou facilmente disponíveis.
*   **Compilação Cruzada:** Em muitos casos, será necessário configurar um ambiente de compilação cruzada em um sistema moderno para gerar executáveis para as plataformas antigas.

**Não há comandos de instalação universais para essas plataformas.** A abordagem seria altamente manual e específica para cada combinação de OS/arquitetura/compilador. Recomenda-se pesquisar as ferramentas de desenvolvimento e bibliotecas disponíveis para a versão exata do sistema operacional que você deseja suportar.

## Dependências LuaRocks

O pacote `Lua-SilvioWebEngine` será distribuído via LuaRocks. As dependências Lua serão instaladas automaticamente ao instalar o rockspec, mas as dependências C/C++ (compilador, libs de imagem/PDF) ainda precisarão ser instaladas manualmente no sistema.

```bash
luarocks install Lua-SilvioWebEngine-v0.1-1.rockspec
```

**Nota:** Certifique-se de que o LuaRocks esteja configurado para encontrar suas bibliotecas Lua e C/C++ instaladas. Você pode precisar ajustar variáveis de ambiente como `LUA_PATH` e `LUA_CPATH` ou as configurações do LuaRocks.
