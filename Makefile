# Makefile para SilvioWebEngine e SilvioWeb Browser
# Suporte multiplataforma (simplificado para demonstração)

# Variáveis Gerais
PROJECT_NAME = SilvioWebEngine
LUA_MODULE_NAME = silviowebengine
BROWSER_APP_NAME = silviowebbrowser

SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

CXX_SOURCES = $(SRC_DIR)/$(PROJECT_NAME).cpp
LUA_SOURCES = $(SRC_DIR)/$(LUA_MODULE_NAME).lua $(SRC_DIR)/$(BROWSER_APP_NAME).lua

# Detectar Sistema Operacional
UNAME_S := $(shell uname -s)

# Compilador C++ e Flags
CXX = g++
CXXFLAGS = -Wall -fPIC -std=c++11

# Flags do Linker
LDFLAGS = -shared

# Dependências Lua (ajuste conforme sua instalação de Lua)
# Para sistemas modernos, o LuaRocks geralmente gerencia isso.
# Para sistemas antigos, a instalação do Lua e seus headers/libs seria manual.
LUA_INCLUDE_DIR = /usr/local/include/lua5.4 # Exemplo para Lua 5.4
LUA_LIB_DIR = /usr/local/lib
LUA_LIBS = -llua5.4 -lm

# Nomes dos arquivos de saída
ifeq ($(UNAME_S),Linux)
    TARGET_LIB = lib$(PROJECT_NAME).so
    LDFLAGS += -Wl,-rpath=$(LUA_LIB_DIR)
else ifeq ($(UNAME_S),Darwin)
    TARGET_LIB = lib$(PROJECT_NAME).dylib
    LDFLAGS += -Wl,-rpath=$(LUA_LIB_DIR)
else ifeq ($(UNAME_S),MINGW32_NT-6.1)
    # MinGW no Windows (para compilação cruzada ou nativa)
    TARGET_LIB = $(PROJECT_NAME).dll
    LUA_INCLUDE_DIR = C:/Lua/5.4/include # Exemplo para Windows
    LUA_LIB_DIR = C:/Lua/5.4/lib
    LUA_LIBS = -llua5.4
else
    # Default para outros sistemas, pode precisar de ajustes
    TARGET_LIB = lib$(PROJECT_NAME).so
endif

# Diretórios de instalação (ajuste conforme necessário)
INSTALL_PREFIX = /usr/local
INSTALL_LIB_DIR = $(INSTALL_PREFIX)/lib
INSTALL_LUA_DIR = $(INSTALL_PREFIX)/share/lua/5.4 # Exemplo para Lua 5.4
INSTALL_BIN_DIR = $(INSTALL_PREFIX)/bin

# Alvos
.PHONY: all clean install uninstall

all: $(BUILD_DIR) $(BUILD_DIR)/$(TARGET_LIB)

$(BUILD_DIR): 
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(TARGET_LIB): $(CXX_SOURCES) $(INCLUDE_DIR)/$(PROJECT_NAME).h
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -I$(LUA_INCLUDE_DIR) $(CXX_SOURCES) $(LDFLAGS) -L$(LUA_LIB_DIR) $(LUA_LIBS) -o $@

clean:
	rm -rf $(BUILD_DIR)

install:
	mkdir -p $(INSTALL_LIB_DIR) $(INSTALL_LUA_DIR) $(INSTALL_BIN_DIR)
	cp $(BUILD_DIR)/$(TARGET_LIB) $(INSTALL_LIB_DIR)/
	cp $(SRC_DIR)/$(LUA_MODULE_NAME).lua $(INSTALL_LUA_DIR)/
	cp $(SRC_DIR)/$(BROWSER_APP_NAME).lua $(INSTALL_BIN_DIR)/$(BROWSER_APP_NAME)
	chmod +x $(INSTALL_BIN_DIR)/$(BROWSER_APP_NAME)

uninstall:
	rm -f $(INSTALL_LIB_DIR)/$(TARGET_LIB)
	rm -f $(INSTALL_LUA_DIR)/$(LUA_MODULE_NAME).lua
	rm -f $(INSTALL_BIN_DIR)/$(BROWSER_APP_NAME)

# --- Seções para sistemas operacionais antigos e arquiteturas específicas ---
# A complexidade de um Makefile para tantos sistemas e arquiteturas é enorme.
# Para DOS (16-bit/32-bit): Seria necessário usar compiladores como Open Watcom, Borland C++.
# As flags e a estrutura de compilação seriam drasticamente diferentes para cada um.
# Exemplo de compilador para DOS 16-bit (8086/8088/80286):
#   CC_DOS16 = owcc -ml
# Exemplo de compilador para DOS 32-bit (80386+):
#   CC_DOS32 = owcc -mt
# A integração com Lua para DOS também seria um desafio, exigindo versões específicas do Lua.

# Para Windows 1.0/2.0/3.0/3.1/3.11/95/98/98SE/ME/2000/XP/Vista/7/8/8.1/10/11:
# As versões mais antigas do Windows exigiriam compiladores como o Visual C++ 6.0 ou Borland C++ Builder.
# As versões modernas podem usar MSVC ou MinGW. O Makefile atual já cobre MinGW.
# Para 16-bit (Windows 3.x), seria necessário um ambiente de desenvolvimento específico (SDK 16-bit).

# Para Linux Kernel 1.0/1.1/1.2/1.3/2.0/2.1/2.2/2.3/2.4/2.5/2.6/3.0/3.x/4.x/5.x/6.x/7.x:
# O GCC é o compilador padrão. As diferenças estariam mais nas versões das bibliotecas e no kernel.
# O Makefile atual deve funcionar para a maioria das versões modernas do Linux com GCC.
# Para versões muito antigas, pode ser necessário usar versões mais antigas do GCC.

# Para MacOS Mais Antigo e Mais Moderno (m68k/PPC/x86_32/x86_64/AArch64):
# Seria necessário usar compiladores específicos para cada arquitetura e versão do MacOS.
# - m68k (Macintosh 512K, 68000/68010/68020/68030/68040/68060): CodeWarrior ou GCC para m68k.
# - PPC/PPC64: CodeWarrior ou GCC para PowerPC.
# - x86_32/x86_64: Clang/GCC (Xcode).
# - AArch64: Clang/GCC (Xcode).
# Cada um exigiria um conjunto diferente de flags de compilação e linkagem.

# Este Makefile é um ponto de partida e precisaria de scripts de configuração
# ou sistemas de build mais avançados (como CMake, Autotools, ou scripts específicos
# para cada plataforma/arquitetura) para gerenciar todas as variações de forma robusta.
# A compilação cruzada para todas essas plataformas a partir de um único ambiente
# é um projeto de engenharia de build complexo por si só.
