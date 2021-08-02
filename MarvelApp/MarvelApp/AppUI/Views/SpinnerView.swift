//
//  SpinnerView.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class SpinnerView: UIView {
    var view: UIView!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView! { didSet { containerView.layer.cornerRadius = 4 } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "SpinnerView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func showSpinnerView(inView: UIView) {
        self.view.frame = inView.bounds
        self.indicatorView.startAnimating()
        inView.addSubview(self)
    }
    
    func removeSpinnerView() {
        self.indicatorView.stopAnimating()
        self.removeFromSuperview()
    }
}
