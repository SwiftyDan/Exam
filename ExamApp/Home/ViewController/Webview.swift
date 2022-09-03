//
//  Webview.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 9/3/22.
//

import UIKit
import WebKit

class WebView: BaseViewController {

    // MARK: - Properties
    private var param = [String:Any]()
    private var titleStr = ""
    private var contentStr = ""
    
    // MARK: - UI Component
    private let webView: WKWebView = {
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()

        let viewPortScript = """
            var meta = document.createElement('meta');
            meta.setAttribute('name', 'viewport');
            meta.setAttribute('content', 'width=device-width');
            meta.setAttribute('initial-scale', '1.0');
            meta.setAttribute('maximum-scale', '1.0');
            meta.setAttribute('minimum-scale', '1.0');
            meta.setAttribute('user-scalable', 'no');
            document.getElementsByTagName('head')[0].appendChild(meta);
        """
        let script = WKUserScript(source: viewPortScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        contentController.addUserScript(script)
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.selectionGranularity = .character
        config.userContentController = contentController
        
        let web = WKWebView(frame: .zero, configuration: config)
        web.translatesAutoresizingMaskIntoConstraints = false
        web.scrollView.showsVerticalScrollIndicator = false
        web.scrollView.isScrollEnabled = true
        return web
    }()
    private let contentTextView: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textContainerInset = UIEdgeInsets(top: 20, left: 30, bottom: 10, right: 30)
        txt.backgroundColor = .white
        txt.textColor = .black
        txt.font = .godo_M(14)
        txt.isEditable = false
        return txt
    }()
    
    // MARK: - Override
    convenience init(title: String, content: String) {
        self.init()
        self.titleStr = title
        self.contentStr = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        view.addSubview(webView)
//        view.addSubview(contentTextView)
        layout()
    }
    
    // MARK: - Private Method
    private func initialSetting() {
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow, title: self.titleStr)
        showBackButton()
        view.backgroundColor = .white
//        contentTextView.text = contentStr.trimHTMLTags()
        
    
        let url = URL(string: contentStr)
        webView.load(URLRequest(url: url!))
        
    }
    

    // MARK: - Internal Method

    
    // MARK: - UITextViewDelegate

    
}

// MARK: - Layout
extension WebView {
    private func layout() {
        let margins = view.safeAreaLayoutGuide
        
//        contentTextView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
//        contentTextView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        contentTextView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
//        contentTextView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        webView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        webView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        webView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        webView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
    }
}
