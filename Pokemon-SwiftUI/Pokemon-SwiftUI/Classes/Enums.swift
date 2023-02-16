//
//  Enums.swift
//  SGUBeta
//
//  Created by Felipe Bastos on 04/02/21.
//

import Foundation

enum FieldType {
    case none
    case CPF
    case birthday
    case login
    case password
}

enum RequestType {
    case get
    case post
}

enum MemberStatus: Int, Codable {
    case undefined = 0
    case active = 1
    case away = 2
    case leave = 3
}

enum PriestStatus: Int, Codable {
    case active = 1
    case away = 2
    case leave = 3
}

enum HistoryType: Int, Codable {
    case comment = 2
    case check = 1
    case church = 5
    case memberShared = 4
    case returnedMember = 3
}

enum MaritalStatus: Int, Codable {
    case single = 1
    case married = 2
    case divorced = 3
    case widower = 4
}

enum GenderName: Int, Codable{
    case male = 1
    case female = 2
}

enum MessageType {
    case error
    case warning
    case success
}

enum ProfileType {
    case user
    case member
}

enum ListType: Int, Codable {
    
    case memberPendent = 1
    case recipient = 2
    case rescue = 3
    case verified = 4
    case accompaniment = 5
    case frequenter = 6
    case returned = 7
    case member = 8
    case sympathizer = 9
    case young = 10
    case worker = 11
    case evangelist = 12
    case groupNone = 13
    case groupOther = 14
    case memberActive = 15
    case memberAway = 16
    case memberLeave = 17
    case returnedWithUser = 18
    case verifiedByMe = 19
    case search = 20
    case workers = 21
    case priests = 22
    case rescueByMe = 23
    
    //--------------------------------------------
    //  Group
    //--------------------------------------------
    
    case groupWelcome = 24
    case groupNao = 25
    case groupOutros = 26
    case groupObreiros = 27
    case groupArimateia = 28
    case groupBatismo = 29
    case groupCalebe = 30
    case groupCdeA = 31
    case groupDepressao = 32
    case groupEBI = 33
    case groupEVG = 34
    case groupFJU = 35
    case groupFTU = 36
    case groupLibras = 37
    case groupResgate = 38
    case groupSaude = 39
    case groupSocio = 40
    case groupTerapia = 41
    case groupUFP = 42
    case groupUNP = 43
    case groupVicio = 44
}

enum FilterOptionType: Int, Codable {
    case ageRange = 0
    case maritalState = 1
    case relationState = 2
    case gender = 3
    case country = 4
    case state = 5
    case city = 6
    case neightborhood = 7
    case baptismIn = 8
    case baptismBy = 9
    case baptismDateEnd = 10
    case baptismDateStart = 11
    case cpf = 12
}

enum ScrollingDirection {
    case none
    case up
    case down
}

enum ScreenModel {
    case unknown
    case iPhone_4       // iPhone 4 and 4S
    case iPhone_5       // iPod Touch, iPhone 5, 5C, 5S and SE
    case iPhone_8       // iPhone 6, 6S, 7 and 8
    case iPhone_Plus    // iPhone 6 Plus, 7 Plus and 8 Plus
    case iPhone_X
    case iPad
}
