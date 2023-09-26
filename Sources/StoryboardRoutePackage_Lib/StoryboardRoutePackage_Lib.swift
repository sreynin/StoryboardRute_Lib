
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
   public static func instantiateFromStoryboard(sbName:String) -> Self {
        return instantiateFromStoryboardHelper(sbName:sbName)
    }
    
    public static func instantiateFromStoryboardHelper<T>(sbName:String) -> T {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.module)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}




