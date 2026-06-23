#ifndef SILVIOWEBENGINE_H
#define SILVIOWEBENGINE_H

#include <string>

class SilvioWebEngine {
public:
    void init();
    void renderHTML(const std::string& htmlContent, const std::string& cssContent);
    void loadImage(const std::string& imagePath);
    void renderPDF(const std::string& pdfPath);
    void shutdown();
};

#endif // SILVIOWEBENGINE_H
