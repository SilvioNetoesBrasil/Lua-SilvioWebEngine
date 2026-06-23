-- silviowebengine.lua - Binding Lua para o SilvioWebEngine C++
-- Este arquivo conteria a interface Lua para as funcionalidades do motor de renderização C++.

local ffi = require("ffi")

-- Carrega a biblioteca C++ (assumindo que será compilada como uma DLL/SO)
ffi.cdef[[
    void SilvioWebEngine_init();
    void SilvioWebEngine_renderHTML(const char* htmlContent, const char* cssContent);
    void SilvioWebEngine_loadImage(const char* imagePath);
    void SilvioWebEngine_renderPDF(const char* pdfPath);
    void SilvioWebEngine_shutdown();
]]

local lib = ffi.load("SilvioWebEngine") -- Nome da biblioteca compilada

local SilvioWebEngine = {}

function SilvioWebEngine.init()
    lib.SilvioWebEngine_init()
end

function SilvioWebEngine.renderHTML(htmlContent, cssContent)
    lib.SilvioWebEngine_renderHTML(htmlContent, cssContent)
end

function SilvioWebEngine.loadImage(imagePath)
    lib.SilvioWebEngine_loadImage(imagePath)
end

function SilvioWebEngine.renderPDF(pdfPath)
    lib.SilvioWebEngine_renderPDF(pdfPath)
end

function SilvioWebEngine.shutdown()
    lib.SilvioWebEngine_shutdown()
end

return SilvioWebEngine
