//: Playground - noun: a place where people can play

//: POO

// Comportement par référence
// Possibilité d'héritage
class Restaurant {
    
    var name = ""
    var address = ""
    
    var isVisited = false
    var grade = 0
    var menu = [Plat]()
}

class FoodTruck: Restaurant {
    var localisation: String = ""
}

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
let resto = Restaurant()
resto.grade = 10
//resto = Restaurant()


var salade1 = Plat(name: "Salade", details: "Salade", price: 10)
var salade2 = salade1

salade1.price = 20
salade1.priceUSD
salade1.priceSEK = 1000
//salade1.priceUSD = 1000 Impossible car Get-Only


salade1.price
salade2.price

let r1 = Restaurant()
r1.name = "1"

var r2 = r1

r1.name = "10"

r1.name
r2.name



var a = 5
var b = a

a = 8

a
b

class RestaurantDirectory {
    
    var directory = [Restaurant]()
    
    func add(_ restaurant: Restaurant) {
        directory.append(restaurant)
    }
    
    func list() -> [Restaurant] {
        return directory
    }
    
    func mange(_ aliment: Plat, dans lieu: FoodTruck = FoodTruck(), avec pote: String = "") {
        
        print("Je mange aliment dans dans")
        print("A", "B", separator: "-", terminator: ",")
    }
}


let dir = RestaurantDirectory()
dir.add(resto)


dir.mange(salade, dans: FoodTruck(), avec: "Toto")
dir.mange(salade, dans: FoodTruck())

dir.mange(salade, avec: "Toto")

func load(url: String) -> (code: Int, message: String) {
    
    return (200, "OK")
}

let result = load(url: "")
result.message

var ratios = (x: 1, y: 2)
ratios.x = 2
ratios




// Réfléchir sur la possibilité de ne pas noter un resto si pas visité
    // Utiliser une erreur, via une methode
        // Empecher l'accès direct

// Ajouter un "remove restaurant" comme méthode dans le directory
// Empecher l'utilisation du tableau du Directory

r1.isVisited
r1.grade










