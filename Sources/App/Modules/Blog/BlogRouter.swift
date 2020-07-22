import Vapor

struct BlogRouter: RouteCollection {
    
    let controller = BlogFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("blog", use: self.controller.blogView)
    }
}
