
import UIKit

public struct StoryboardRoutePackage_Lib {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

public protocol Instantiable: AnyObject {
    static var storyboardName: String {get}
}

extension Instantiable {
   public static func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    public static func instantiateFromStoryboardHelper<T>() -> T {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}




