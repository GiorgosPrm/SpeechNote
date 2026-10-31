import Foundation
import SwiftData

@Model
final class Note {
    var id: UUID
    var content: String
    var createdAt: Date
    
    init(content: String, createdAt: Date = Date()) {
        self.id = UUID()
        self.content = content
        self.createdAt = createdAt
    }
}
