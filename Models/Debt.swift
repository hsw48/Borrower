//
//  Debt.swift
//  Borrower
//
//  Created by Harrison Woodward on 6/30/16.
//  Copyright © 2016 Harrison Woodward. All rights reserved.
//

import Foundation
import RealmSwift


class Debt: Object {
    dynamic var name : String = ""
    dynamic var what : String = ""
    dynamic var currentDate : String = ""
    dynamic var returnDate : String = ""
}
