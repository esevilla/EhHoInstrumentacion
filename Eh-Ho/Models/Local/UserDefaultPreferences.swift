//
//  UserDefaultPreferences.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation


class UserDefaultsPreferences {
    
    private let keyUserDateLastDownload = "DATE_LAST_DOWNLOAD"
    
    func saveLastDownload() {
        UserDefaults.standard.set(Date(), forKey: keyUserDateLastDownload)
    }
    
    func loadLastDownload() -> Date {
        return UserDefaults.standard.object(forKey: keyUserDateLastDownload) as! Date
    }

}
