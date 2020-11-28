//
//  RepositoriesCell.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import UIKit

struct ReposEntity {
    var isExpanded: Bool = false
}
protocol RepositoriesCellDelegate: class {
    func repoCellArrowTapped(cell: RepositoriesCell)
}

class RepositoriesCell: UITableViewCell {
    //MARK:- OutLets
    @IBOutlet private  var containerView: UIView!
    @IBOutlet private  var expandedView: UIView!
    @IBOutlet private  var arrowImageView: UIImageView!
    @IBOutlet weak var repoTitleLabel: UILabel!
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //MARK:- Vars
    weak var delegate: RepositoriesCellDelegate?
    override func setupViews() {
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
        self.selectionStyle = .none
        ownerImage.makeCircular()
    }
    //MARK:- Configure Cell
    func configure(repo: Repositories ,isExpanded: Bool) {
        repoTitleLabel.text = repo.name ?? ""
        expandedView.isHidden = !isExpanded
        arrowImageView.image = isExpanded ? #imageLiteral(resourceName: "blackDwonArrow"):#imageLiteral(resourceName: "blackUpArrow")
        let url = URL(string: repo.owner?.avatarURL ?? "")
        ownerImage.downloadImage(from: url!)
        descriptionTextView.text = repo.description ?? ""
    }
    //MARK:- Actions
    @IBAction func arrowImageViewTapped() {
        delegate?.repoCellArrowTapped(cell: self)
    }
}
