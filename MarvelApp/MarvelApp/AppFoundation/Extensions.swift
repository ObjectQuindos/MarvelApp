//
//  Extensions.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

extension UIStoryboard {
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: UINames.mainStoryBoard,bundle: Bundle.main)
    }
    
    static var createCharactersViewController: CharactersViewController {
        let viewController = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: UINames.charactersViewController) as! CharactersViewController
        return viewController
    }
    
    static var createCharacterDetailViewController: CharacterDetailViewController {
        let viewController = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: UINames.characterDetailViewController) as! CharacterDetailViewController
        return viewController
    }
    
    static var createErrorScreenViewController: ErrorScreenViewController {
        let viewController = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: UINames.errorScreenViewController) as! ErrorScreenViewController
        return viewController
    }
}

extension String {
    
    func setFormatStyle(locale: Locale? = Locale(identifier: "es_ES")) -> String {
        let ISO8601 = ISO8601DateFormatter()
        
        if let date = ISO8601.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = locale
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        return ""
    }
}

extension Collection where Iterator.Element == [String : Any] {
    
    func toJSONString(options: JSONSerialization.WritingOptions = .prettyPrinted) -> String {
        if let arr = self as? [[String : Any]],
           let dat = try? JSONSerialization.data(withJSONObject: arr, options: options),
            let str = String(data: dat, encoding: String.Encoding.utf8) {
            return str
        }
        return "[]"
    }
}

extension Dictionary {
    
    func toJSONString(options: JSONSerialization.WritingOptions = .prettyPrinted) -> String {
        if let dict = self as? [String : Any] ,
           let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: options),
           let str = String(data: jsonData, encoding: .utf8) {
            return str
        }
        return "{}"
    }
}
