//
//  WisataDetail.swift
//  ParsingJSON3
//
//  Created by Audi Dharmawan on 29/12/17.
//  Copyright © 2017 Audi Dharmawan. All rights reserved.
//

import Foundation

struct WisataDetail:Decodable{
    let id_data: Int
    let title: String
    let description: String
    let url_image: String
}

struct WisataDescription: Decodable {
    let status: Bool
    let status_code: Int
    let data: [WisataDetail]
}
