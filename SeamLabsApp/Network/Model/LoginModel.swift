
//  MovieResult.swift
//  My Cinema Movies
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//


import Foundation
struct LoginModel : Codable {
	let success : Bool?
	let expires_at : String?
	let request_token : String?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case expires_at = "expires_at"
		case request_token = "request_token"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		expires_at = try values.decodeIfPresent(String.self, forKey: .expires_at)
		request_token = try values.decodeIfPresent(String.self, forKey: .request_token)
	}

}
