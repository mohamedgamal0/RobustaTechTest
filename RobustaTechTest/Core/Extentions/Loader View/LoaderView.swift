//
//  LoaderView.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import UIKit

class LoaderView: UIView {
    
    class func instanceFromNib() -> LoaderView {
        return UINib(nibName: "LoaderView",
                     bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! LoaderView
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
}

extension UIViewController {
    var loaderView: LoaderView {
        
        let window = UIApplication.shared.windows.filter({return $0.isKeyWindow}).first!
        for view in window.subviews where view is LoaderView {
            return view as! LoaderView
        }
        for view in self.view.subviews where view is LoaderView {
            return view as! LoaderView
        }
        return LoaderView.instanceFromNib()
    }
    
    func animateLoader(overContext: Bool = false) {
        let loader = self.loaderView
        if overContext == true {
            let window = UIApplication.shared.windows.filter({return $0.isKeyWindow}).first!
            for view in window.subviews where view is LoaderView {
                return
            }
            loader.frame = window.frame
            window.addSubview(loader)
        } else {
            for view in self.view.subviews where view is LoaderView {
                return
            }
            loader.frame = self.view.bounds
            self.view.addSubview(loader)
        }
    }
    
    func stopLoader() {
        UIView.animate(withDuration: 0.3, animations: {
            self.loaderView.alpha = 0
        }, completion: { _ in
            self.loaderView.removeFromSuperview()
        })
    }
    
    
}
