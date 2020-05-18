//
//  SignUp.swift
//  Dramatist
//
//  Created by Gr.Skiy on 13.05.2020.
//  Copyright © 2020 Gr.Skiy. All rights reserved.
//

import Foundation

struct SignUp: Encodable {
    private enum CodingKeys: String, CodingKey {
        case userName = "login"
        case password = "password_hash"
        case deviceName = "device_id"
        case name
        case surname
        case email
        case phone
    }

    let userName: String
    let password: String
    let deviceName: String
    let name: String
    let surname: String
    let email: String?
    let phone: String?
}
