//
//  TitlePreviewViewController.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 02/04/2026.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is Best Movie "
        return label
        
    }()
    
    private let downloadButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let webview: WKWebView = {
        let webview = WKWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webview)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        configureConstraints()
        
        
    }
    
    func  configureConstraints(){
        let webViewConstriants = [
            webview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webview.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let titleLabelContraints = [
            titleLabel.topAnchor.constraint(equalTo: webview.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overViewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 15),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
            
        ]
        
        NSLayoutConstraint.activate(webViewConstriants)
        NSLayoutConstraint.activate(titleLabelContraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    func configure(with model: TitlePreviewViewModel){
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeview.id.videoId)") else {return}
        
        webview.load(URLRequest(url: url))
    }

}
