//
//  User.swift
//  Dramatist
//
//  Created by Gr.Skiy on 13.05.2020.
//  Copyright © 2020 Gr.Skiy. All rights reserved.
//

import Foundation

struct User: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case userName = "login"
        case email
        case phone
        case name
        case surname
    }

    let id: Int
    let userName: String
    let email: String?
    let phone: String?
    let name: String
    let surname: String
}
