//: Playground - noun: a place where people can play

//: POO

// Comportement par référence
// Possibilité d'héritage
struct Restaurant: Hashable, CustomStringConvertible  {
    
    var name: String
    var address: String
    
    var isVisited: Bool
    
    var grade: Int?
//    var grade: Optional<Int>
    
    var menu: [Plat]
    
    static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        if rhs.name == lhs.name && rhs.address == lhs.address {
            return true
        }
        return false
    }
    
    var hashValue: Int {
        return (name + address).hashValue
    }
    
    var description: String {
        return "Le resto \(name) est à l'adresse \(address)"
    }
}

//class FoodTruck: Restaurant {
//    var localisation: String = ""
//}

// Comportement par copie (value type)
struct Plat {
    
    let name: String
    let details: String
    var price: Float
    
    //Computed property (lecture seule)
    var priceUSD: Float {
        return price * Plat.usdEurRate
    }
    
    //Computed property
    var priceSEK: Float {
        get {
            return price * 100
        }
        
        set(newPrice) {
            price = newPrice / 100
        }
    }
    
    static var usdEurRate: Float = 1.2
}

//  Héritage impossible pour les structs
//struct Dessert: Plat {
//    
//}

// Instance de struct let, tout est let (constant)
let salade = Plat(name: "Salade", details: "Salade", price: 10)
//salade.price = 11
//salade = Plat(name: "", details: "", price: 0)

Plat.usdEurRate = 1.2

// Instance de class let -> Possibilité de changer les membres var
//let resto = Restaurant()
//resto.grade = 10
//resto = Restaurant()


var salade1 = Plat(name: "Salade", details: "Salade", price: 10)
var salade2 = salade1

class RestaurantDirectory {
    
    private var directory = [Restaurant]()
    
    func add(_ restaurant: Restaurant) {
        directory.append(restaurant)
    }
    
    func list() -> [Restaurant] {
        return directory
    }
    
    func remove(restaurant: Restaurant) {
        
        guard let index = directory.index(of: restaurant) else { return }
        directory.remove(at: index)
    }
    
    func mange(_ aliment: Plat, dans lieu: String = "", avec pote: String = "") {
        
        print("Je mange aliment dans dans")
        print("A", "B", separator: "-", terminator: ",")
    }
}


// Réfléchir sur la possibilité de ne pas noter un resto si pas visité
    // Utiliser une erreur, via une methode
        // Empecher l'accès direct

// Empecher l'utilisation du tableau du Directory -> Visibilité-
// Ajouter un "remove restaurant" comme méthode dans le directory -> Protocoles

let resto = Restaurant(name: "Toto", address: "1 Rue de la Paix", isVisited: false, grade: 0, menu: [])
let dir = RestaurantDirectory()
dir.add(resto)


dir.mange(salade, dans: "", avec: "Toto")
dir.mange(salade, dans: "")

dir.mange(salade, avec: "Toto")


if let note = resto.grade {
    let x2 = note * 2
} else {
    
}

guard let note = resto.grade else { fatalError("bad things happen") }
let x2 = note * 2

// == compare les valeurs
// === compare l'identité (donc objects uniquement)

var set: Set<Restaurant> = [resto]

set.count

set.insert(resto)

print("\(resto)")

