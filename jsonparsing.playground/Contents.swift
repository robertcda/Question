import UIKit
var json = Data("""
{
    "results": [
    {"type":"Plant", "name":"Strawberry"},
    {"type":"Human", "name":"Robert"},
    {"type":"Human", "name":"Clarence"},
    {"type":"Animal", "name":"Dog"},
    {"type":"Animal", "name":"Cat"},
    {"type":"Animal", "name":"Rat"}
    ]
}
""".utf8)
struct Response: Codable {}
var response = try? JSONDecoder().decode(Response.self, from: json)

protocol DataSource {
    associatedtype Item
    func fetchPlants() -> [Item]
    func fetchHumans() -> [Item]
    func fetchAnimals() -> [Item]
}

struct Provider: DataSource {
    init() {
    }
    struct Identity {
    }
    func fetchPlants() -> [Identity] {
        return []
    }
    func fetchHumans() -> [Identity] {
        return []
    }
    func fetchAnimals() -> [Identity] {
        return []
    }
}

func createDataSource() -> some DataSource {
    return Provider()
}

var source: some DataSource = createDataSource()
if source.fetchPlants().count != 1 {
    print("Fail")
}
if source.fetchHumans().count != 2 {
    print("Fail")
}
if source.fetchAnimals().count != 3 {
    print("Fail")
}
