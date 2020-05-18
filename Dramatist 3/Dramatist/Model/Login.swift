//
//  Login.swift
//  Dramatist
//
//  Created by Gr.Skiy on 13.05.2020.
//  Copyright © 2020 Gr.Skiy. All rights reserved.
//

import Foundation

struct Login: Encodable {
    private enum CodingKeys: String, CodingKey {
        case userName = "Login"
        case password = "password_hash"
        case deviceName = "device_id"
    }
    
    let userName: String
    let password: String
    let deviceName: String
}
