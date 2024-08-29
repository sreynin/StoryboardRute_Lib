
import UIKit

public protocol StringConvertible {
    var rawValue: String {get}
}

public protocol Instantiable: AnyObject {
    static var storyboardName: StringConvertible {get}
}

extension Instantiable {
   public static func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    public static func instantiateFromStoryboardHelper<T>() -> T {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}




