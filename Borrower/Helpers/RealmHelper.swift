//
//  RealmHelper.swift
//  Borrower
//
//  Created by Julia Woodward on 7/1/16.
//  Copyright © 2016 Harrison Woodward. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addDebt(debt: Debt) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(debt)
        }
    }
    static func deleteDebt(debt: Debt) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(debt)
        }
    }
    static func updateDebt(debtToBeUpdated: Debt, newDebt: Debt) {
        let realm = try! Realm()
        try! realm.write() {
            debtToBeUpdated.name = newDebt.name
            debtToBeUpdated.what = newDebt.what
            debtToBeUpdated.returnDate = newDebt.returnDate
        }
    }
    static func retrieveDebts() -> Results<Debt> {
        let realm = try! Realm()
        return realm.objects(Debt).sorted("returnDate", ascending: false )
    }
}