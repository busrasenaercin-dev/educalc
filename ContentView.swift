import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        ZStack {
            // Arka plan parlamasını engellemek için koyu renk
            Color(red: 0.05, green: 0.05, blue: 0.1).ignoresSafeArea()
            
            // DİKKAT: .all yerine sadece .bottom diyoruz.
            // Böylece üst taraftaki çentiği (Dinamik Ada) korumuş oluyoruz!
            EduCalcView()
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

// Aşağıdaki EduCalcView yapısı aynı kalacak, dokunmana gerek yok.
struct EduCalcView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = Bundle.main.url(forResource: "EduCalc", withExtension: "html") {
            uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}
