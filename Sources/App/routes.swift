import Vapor

func routes(_ app: Application) throws {
    
    app.get { req -> EventLoopFuture<View> in
        struct Context: Encodable {
            let title: String
            let body: String
        }
        let context = Context(title: "myProject - Leaf", body: "Hello Leaf!")
        return req.view.render("index", context)
    }
}
