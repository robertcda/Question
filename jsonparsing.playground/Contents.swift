import UIKit

// Lets assume that the API returns this data
var json = Data("""
{
    "results": [
    {"type":"Plant", "name":"Strawberry"},
    {"type":"Human", "name":"Robert", "age": 11},
    {"type":"Human", "name":"Clarence", "age": 20},
    {"type":"Animal", "name":"Dog", "age": 3},
    {"type":"Animal", "name":"Cat", "age": 4},
    {"type":"Animal", "name":"Rat", "age": 5}
    ]
}
""".utf8)
struct Response: Codable {}
var response = try? JSONDecoder().decode(Response.self, from: json)


/// Feel free to modify this protocol with a better interface.
protocol DataSource {
    associatedtype Item
    func fetchPlants() -> [Item]
    func fetchAdultAgedHumans() -> [Item] //Anyone who is older than 18 years.
    func fetchAnimals() -> [Item]
}


/// READ: Please implement a Data Source, which gets the required information from the JSON Data.
struct Provider: DataSource {
    struct Identity {
    }
    func fetchPlants() -> [Identity] {
        return []
    }
    func fetchAdultAgedHumans() -> [Identity] {
        return []
    }
    func fetchAnimals() -> [Identity] {
        return []
    }
}

func createDataSource() -> some DataSource {
    return Provider()
}

/*
 We need to be able to get the number of plants, humans and animals.
 */
var source: some DataSource = createDataSource()
if source.fetchPlants().count != 1 {
    print("Fail")
}
if source.fetchAdultAgedHumans().count != 1 {
    print("Fail")
}
if source.fetchAnimals().count != 3 {
    print("Fail")
}
