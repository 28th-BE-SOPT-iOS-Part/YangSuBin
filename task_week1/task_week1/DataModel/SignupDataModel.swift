//
//  SignupDataModel.swift
//  task_week1
//
//  Created by μμλΉ on 2021/05/10.
//

import Foundation

// MARK: - SignupDataModel
struct SignupDataModel: Codable {
    let success: Bool
    let message: String
    let data: SignupUserData?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
}

// MARK: - DataClass
struct SignupUserData: Codable {
    let userID: Int
        let userNickname, token: String

        enum CodingKeys: String, CodingKey {
            case userID = "UserId"
            case userNickname = "user_nickname"
            case token
        }
}
