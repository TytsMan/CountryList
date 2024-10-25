//
//  UIViewExt.swift
//  CountriesList
//
//  Created by divan on 10/25/24.
//

import UIKit

extension UIView {
    var wrapped: UIView {
        let wrapper = UIView()
        wrapper.addSubview(self)
        snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.top.greaterThanOrEqualToSuperview()
            make.trailing.bottom.lessThanOrEqualToSuperview()
        }
        return wrapper
    }
}
