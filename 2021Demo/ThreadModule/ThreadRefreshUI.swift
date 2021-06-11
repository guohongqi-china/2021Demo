//
//  ThreadRefreshUI.swift
//  2021Demo
//
//  Created by guohongqi on 2021/5/25.
//

import UIKit

@objc class ThreadRefreshUI: UIView {


    @objc @IBOutlet weak var timeLab: UILabel!
    
    @objc static func loadNibView() -> ThreadRefreshUI{
        guard let view = Bundle.main.loadNibNamed("ThreadRefreshUI", owner: nil, options: nil)?.last as? ThreadRefreshUI else {
            return ThreadRefreshUI()
        }
        return view
    }
    
}
