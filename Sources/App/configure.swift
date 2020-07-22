import Vapor
import Leaf

// configures your application
public func configure(_ app: Application) throws {

     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register Leaf
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease
    
    // register routes
    try routes(app)
}
