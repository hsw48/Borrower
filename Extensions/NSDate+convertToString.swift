//
//  NSDate+convertToString.swift
//  Borrower
//
//  Created by Harrison Woodward on 6/30/16.
//  Copyright © 2016 Harrison Woodward. All rights reserved.
//

import Foundation

extension NSDate {
    func convertToString() -> String {
        return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    }
}