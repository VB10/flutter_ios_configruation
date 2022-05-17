
import Flutter
import UIKit

public class SwiftPigeonPlugin: NSObject, BookApi {

    public func searchKeyword(_ keyword: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> [Book]? {
        let bookTest = Book()
        bookTest.title = "vb100k"
        bookTest.author = "vb10"
        return [
            bookTest
        ]
    }
}
