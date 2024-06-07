//
//  Date+Extensions.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import Foundation

extension Date {
    func string(
        with format: String = "dd/MM/yyyy"
    ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
