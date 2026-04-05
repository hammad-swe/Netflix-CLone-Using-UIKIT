//
//  TitleTableViewCell.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 01/04/2026.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitlesButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let TitleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(TitleLabel)
        contentView.addSubview(playTitlesButton)
        
        applyConstraints()
    }

    private func applyConstraints(){
        let titlesPosterUIImageViewConstraints = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant:  100),
        ]
        
        let titleLabelConstraints = [
            TitleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 20),
            TitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ]
        
        let playTitlesButtonConstraints = [
            playTitlesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitlesButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitlesButtonConstraints)
    }
    public func configure(with model: TitleViewModel){
       
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else{
            return
        }
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        TitleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
