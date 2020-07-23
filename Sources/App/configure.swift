import Vapor
import Leaf
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {

    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register Leaf
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease
    
    // Fluent
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    // register routes
//    let routers: [RouteCollection] = [
//        FrontendRouter(),
//        BlogRouter(),
//    ]
//    for router in routers {
//        try router.boot(routes: app.routes)
//    }
    
    let modules: [Module] = [
            FrontendModule(),
            BlogModule(),
        ]

        for module in modules {
            try module.configure(app)
        }
    

}
