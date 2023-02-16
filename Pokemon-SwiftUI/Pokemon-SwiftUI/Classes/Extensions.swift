//
//  Extensions.swift
//  SGUBeta
//
//  Created by Daniel Reis on 19/01/21.
//

import SwiftUI

//-----------------------------------------------------------------------
//  MARK: - UIApplication
//-----------------------------------------------------------------------

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
      
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//-----------------------------------------------------------------------
//  MARK: - UIScreen
//-----------------------------------------------------------------------

extension UIScreen {

    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}

//-----------------------------------------------------------------------
//  MARK: - View
//-----------------------------------------------------------------------

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

//-----------------------------------------------------------------------
//  MARK: - Color
//-----------------------------------------------------------------------

extension Color {
    
    static var BlueDark: Color {
        return Color("BlueDark")
    }
    
    static var BlueMedium: Color {
        return Color("BlueMedium")
    }
    
    static var BlueDark_White: Color  {
        return Color("BlueDark-White")
    }
    
    static var BlueLight: Color {
        return Color("BlueLight")
    }
    
    static var GrayLight: Color {
        return Color("GrayLight")
    }
    
    static var White_BlueDark: Color {
        return Color("White-BlueDark")
    }
    
    static var GrayLight_Clear: Color {
        return Color("GrayLight-Clear")
    }
    
    static var Black_White: Color {
        return Color("Black-White")
    }
    
    static var GreenLight: Color {
        return Color("GreenLight")
    }
    
    static var GraphPurple: Color{
        return Color("GraphPurple")
    }
    
    static var GraphRed: Color {
        return Color("GraphRed")
    }
    
    static var BlueHardlight: Color {
        return Color("BlueHardlight")
    }
    
    static var BlueStrong: Color {
        return Color("BlueStrong")
    }
    
    static var GrayMiddle: Color {
        return Color("GrayMiddle")
    }
    
    static var BlueHardlightAlpha: Color {
        return Color("BlueHardlightAlpha")
    }
    
    static var Gray_Black: Color {
        return Color("Gray-Black")
    }
    
    static var White_Clear: Color {
        return Color("White-Clear")
    }
    
    static var GrayLight_BlackAlpha: Color {
        return Color("GrayLight-BlackAlpha")
    }
    
    static var GrayLight_BlueHardMedium: Color {
        return Color("GrayLight-BlueHardMedium")
    }
    
    static var GrayLight_BlueLightMedium: Color {
        return Color("GrayLight-BlueLightMedium")
    }
    
    static var BlueHardMedium: Color {
        return Color("BlueHardMedium")
    }
    
    static var GrayMiddle_GrayLight: Color {
        return Color("GrayMiddle-GrayLight")
    }
    
    static var GrayMiddle_BlackAlpha: Color {
        return Color("GrayMiddle-BlackAlpha")
    }
    
    static var White_BlackAlpha: Color {
        return Color("White-BlackAlpha")
    }
    
    static var White_Black: Color {
        return Color("White-Black")
    }
    
    static var White_BlueHardMedium: Color {
        return Color("White-BlueHardMedium")
    }
    
    static var White_BlueMedium: Color {
        return Color("White-BlueMedium")
    }
    
    static var GrayLight_BlueMedium: Color {
        return Color("GrayLight-BlueMedium")
    }
    
    static var GrayHardMedium_BlueHardMedium: Color {
        return Color("GrayHardMiddle-BlueHardMedium")
    }
    
    static var GrayLightTextBoxBorder: Color {
        return Color("GrayLight-TextBox")
    }
    
    static var GrayHardLight_Transparent: Color {
        return Color("GrayHardLight-Transparent")
    }
    
    static var BlueLightDark: Color {
        return Color("BlueLightDark")
    }
    
    static var BlueDeepDark: Color {
        return Color("BlueDeepDark")
    }
    
    static var BlueDark_BlueHardlight: Color {
        return Color("BlueDark-BlueHardlight")
    }
    
    static var BlueDark_BlueDeepDark: Color {
        return Color("BlueDark-BlueDeepDark")
    }
    
    static var GrayLight_White: Color {
        return Color("GrayLight-White")
    }
    
    static var BluishGray_BlueDark: Color {
        return Color("BluishGray-BlueDark")
    }
    
    static var BluishGray_BlueDeepDark: Color {
        return Color("BluishGray-BlueDeepDark")
    }
    
    static var White_BlueDeepDark: Color {
        return Color("White-BlueDeepDark")
    }
    
    static var White_BlueLightDark: Color {
        return Color("White-BlueLightDark")
    }
    
    static var GrayMiddle_White: Color {
        return Color("GrayMiddle-White")
    }
    
    static var GrayUltraLight: Color {
        return Color("GrayUltraLight")
    }
    
    static var BlueLight_BlueDeepDark: Color {
        return Color("BlueLight_BlueDeepDark")
    }
    
    static var GrayMiddleAlpha_BlackAlpha: Color {
        return Color("GrayMiddleAlpha-BlackAlpha")
    }
}

//-----------------------------------------------------------------------
//    MARK: - Dictionary
//-----------------------------------------------------------------------

extension Dictionary {
    
    func buildQueryString() -> String {
        
        var urlVars:[String] = []
        
        for (key, value) in self {
            
            if value is Array<Any> {
                
                for v in value as! Array<Any> {
                    
                    if let encodedValue = "\(v)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "=" + encodedValue)
                    }
                }
            }else{
                
                if let val = value as? String {
                    if let encodedValue = val.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "=" + encodedValue)
                    }
                }else{
                    urlVars.append((key as! String) + "=\(value)")
                }
            }
        }
        
        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}

//-----------------------------------------------------------------------
//    MARK: - String
//-----------------------------------------------------------------------

extension String {
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    func sanitize() -> Bool {
        
        if self.contains("DELETE") ||
            self.contains("SELECT") ||
            self.contains("DROP") ||
            self.contains("UPDATE") ||
            self.contains("FROM") ||
            self.contains("TABLE") ||
            self.contains("\n") ||
            self.contains(" ") ||
            self.count < 16 ||
            !self.isAlphanumeric{
            return false
        }else{
            return true
        }
    }
    
    func stripDiacritic() -> String {
        return self.folding(options: .diacriticInsensitive, locale: .current)
    }
    
    func index(of char: Character, text: String) -> Int {
        return self.firstIndex(of: char)?.utf16Offset(in: text) ?? 0
    }
    
    func substringWithRange(aRange : CFRange) -> String {

        let nsrange = NSMakeRange(aRange.location, aRange.length)
        let substring = (self as NSString).substring(with: nsrange)
        return substring
    }
    
    func underline() -> NSAttributedString {
        
        let attributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    func html() -> NSAttributedString? {
        
        if let textData = self.data(using: .utf16) {
            
            return try? NSAttributedString(data: textData,
                                           options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html],
                                           documentAttributes: nil)
        }
        
        return nil
    }
    
    func count(of stringToFind: String) -> Int {
        var stringToSearch = self
        var count = 0
        while let foundRange = stringToSearch.range(of: stringToFind, options: .diacriticInsensitive) {
            stringToSearch = stringToSearch.replacingCharacters(in: foundRange, with: "")
            count += 1
        }
        return count
    }
    
    func stripTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    func digits() -> String {
        return self.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
    }
    
    func letters() -> String {
        return self.replacingOccurrences(of: "[^a-zA-Z]+", with: "", options: .regularExpression)
    }
    
    var isValidCPF: Bool {
        
        let numbers = compactMap({Int(String($0))})
        
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        
        let sum1 = 11 - ( numbers[0] * 10 +
            numbers[1] * 9 +
            numbers[2] * 8 +
            numbers[3] * 7 +
            numbers[4] * 6 +
            numbers[5] * 5 +
            numbers[6] * 4 +
            numbers[7] * 3 +
            numbers[8] * 2 ) % 11
        
        let dv1 = sum1 > 9 ? 0 : sum1
        
        let sum2 = 11 - ( numbers[0] * 11 +
            numbers[1] * 10 +
            numbers[2] * 9 +
            numbers[3] * 8 +
            numbers[4] * 7 +
            numbers[5] * 6 +
            numbers[6] * 5 +
            numbers[7] * 4 +
            numbers[8] * 3 +
            numbers[9] * 2 ) % 11
        
        let dv2 = sum2 > 9 ? 0 : sum2
        
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    var isValidCNPJ: Bool {
        
        let numbers = compactMap({Int(String($0))})
        
        guard numbers.count == 14 && Set(numbers).count != 1 else { return false }
        
        let sum1 = 11 - ( numbers[11] * 2 +
            numbers[10] * 3 +
            numbers[9] * 4 +
            numbers[8] * 5 +
            numbers[7] * 6 +
            numbers[6] * 7 +
            numbers[5] * 8 +
            numbers[4] * 9 +
            numbers[3] * 2 +
            numbers[2] * 3 +
            numbers[1] * 4 +
            numbers[0] * 5 ) % 11
        
        let dv1 = sum1 > 9 ? 0 : sum1
        
        let sum2 = 11 - ( numbers[12] * 2 +
            numbers[11] * 3 +
            numbers[10] * 4 +
            numbers[9] * 5 +
            numbers[8] * 6 +
            numbers[7] * 7 +
            numbers[6] * 8 +
            numbers[5] * 9 +
            numbers[4] * 2 +
            numbers[3] * 3 +
            numbers[2] * 4 +
            numbers[1] * 5 +
            numbers[0] * 6 ) % 11
        
        let dv2 = sum2 > 9 ? 0 : sum2
        
        return dv1 == numbers[12] && dv2 == numbers[13]
    }
    
    var isValidEmail: Bool {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}",
                                             options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil && !self.contains(" ")
    }
    
    func dateFromString(with format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    func formatDate(with format: String) -> String { // "yyyy-MM-dd'T'HH:mm:ss"
        
        if let strDate = self.components(separatedBy: "T").first {
            
            let formatterAPI = DateFormatter()
            formatterAPI.dateFormat = "yyyy-MM-dd"
            
            let formatterLocal = DateFormatter()
            formatterLocal.dateFormat = format
            
            if let date = formatterAPI.date(from: strDate) {
                return formatterLocal.string(from: date)
            }
        }
        
        return ""
    }
}

//-----------------------------------------------------------------------
//  MARK: - Date
//-----------------------------------------------------------------------

extension Date {
    
    static func minimum() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: "1920-01-01") ?? Date()
    }
    
    func getMonthAbbreviation() -> String {
        
        let calendar = Calendar.current
        
        let month = calendar.component(.month, from: self)
        
        var abreviationMonth = ""
        
        switch month {
            case 1:
                abreviationMonth = "Jan"
            case 2:
                abreviationMonth = "Fev"
            case 3:
                abreviationMonth = "Mar"
            case 4:
                abreviationMonth = "Abr"
            case 5:
                abreviationMonth = "Mai"
            case 6:
                abreviationMonth = "Jun"
            case 7:
                abreviationMonth = "Jul"
            case 8:
                abreviationMonth = "Ago"
            case 9:
                abreviationMonth = "Set"
            case 10:
                abreviationMonth = "Out"
            case 11:
                abreviationMonth = "Nov"
            case 12:
                abreviationMonth = "Dez"
            default:
                abreviationMonth = ""
        }
        
        return abreviationMonth.uppercased()
    }
    
    func formatDate(format: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    func getDayInYear() -> Int {
        return Calendar.current.ordinality(of: .day, in: .year, for: self)!
    }
    
    func getDay() -> Int {
        return Calendar.current.ordinality(of: .day, in: .month, for: self)!
    }
    
    func getMonth() -> Int {
        return Calendar.current.ordinality(of: .month, in: .year, for: self)!
    }
    
    func getYear() -> Int {
        return Calendar.current.component(.year, from: self)
    }
    
    func today(withTime: Bool = true) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = withTime ? "yyyy-MM-dd HH:mm:ss" : "yyyy-MM-dd"

        return formatter.string(from: Date())
    }
    
    var yesterday: Date { return Calendar.current.date(byAdding: .day, value: -1, to: noon)! }
    
    var noon: Date { return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)! }
    
    func dateToStringWith(dateFormat: String) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}

//-----------------------------------------------------------------------
//  MARK: - UIDevice
//-----------------------------------------------------------------------

extension UIDevice {
    
    static let shared = UIDevice()
    
    func screenModel() -> ScreenModel {
        
        let w: Double = Double(UIScreen.main.bounds.width)
        let h: Double = Double(UIScreen.main.bounds.height)
        let screenHeight: Double = max(w, h)
        
        switch screenHeight {
            
            case 480:
                return .iPhone_4
            
            case 568:
                return .iPhone_5
            
            case 667:
                return UIScreen.main.scale == 3.0 ? .iPhone_Plus : .iPhone_8
            
            case 736:
                return .iPhone_Plus
            
            case 812, 844, 896, 926:
                return .iPhone_X
            
            default:
                return .iPad
        }
    }
    
    var iOSVersion: String {
        return UIDevice.current.systemVersion
    }
    
    var imei: String {
        guard let value = UIDevice.current.identifierForVendor?.uuidString else {
            return ""
        }
        return value
    }
    
    var deviceName: String {
        return UIDevice.current.name
    }
}

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
