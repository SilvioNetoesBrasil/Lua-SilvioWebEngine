-- silviowebbrowser.lua - Navegador Web do Silvio
-- Este é o aplicativo do navegador que usa o SilvioWebEngine.

local SilvioWebEngine = require("silviowebengine")

local SilvioWebBrowser = {}

function SilvioWebBrowser.start(url)
    print("Iniciando SilvioWebBrowser...")
    SilvioWebEngine.init()
    print("Navegando para: " .. url)

    -- Em um navegador real, você faria uma requisição HTTP para obter o conteúdo
    -- Por simplicidade, vamos simular o carregamento de conteúdo
    local htmlContent = "<h1>Bem-vindo ao SilvioWebBrowser!</h1><p>Esta é uma página de exemplo.</p>"
    local cssContent = "h1 { color: blue; } p { font-family: sans-serif; }"

    SilvioWebEngine.renderHTML(htmlContent, cssContent)
    SilvioWebEngine.loadImage("exemplo.png") -- Simula o carregamento de uma imagem
    SilvioWebEngine.renderPDF("documento.pdf") -- Simula o carregamento de um PDF

    print("Navegação concluída.")
    -- SilvioWebEngine.shutdown() -- Desligar o motor quando o navegador for fechado
end

-- Exemplo de uso:
-- SilvioWebBrowser.start("https://www.example.com")

return SilvioWebBrowser
