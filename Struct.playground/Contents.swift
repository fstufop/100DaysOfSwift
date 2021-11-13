import UIKit

struct Sport { //Cria um tipo de dado que armazana propriedades
    var name: String //stored properties - propriedade armazenada
    var isOlympicSport: Bool
    
    var olympicStatus: String { //Computed propertie - Propriedade que roda um código e retorna seu valor
        if isOlympicSport {
            return "\(name) is a Olympic Sport"
        } else {
            return "\(name) is not Olympic Sport"
        }
    }
}
var tennis = Sport(name: "Tennis", isOlympicSport: true)
tennis.name = "Basket"


//Property observer - Uma propriedade computada pode ser criada para observar a mudanção de um atributo utilizando "didSet"
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 20
progress.amount = 70
progress.amount = 100

//Methods - Funções dentro de struct são chamados de métodos
//As funções podem utilizar os atributos que estão dentro das classes

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 5_000)
print(london.collectTaxes().description) //.description converte o valor para String

//Mutating func - As structs são tipos constantes, assim para mudar um método presente em uma struct é necessário criar uma "mitating func"

struct Person {
    var name: String
    
    mutating func makeAnonymous() -> String {
     name = "Anonymous"
        return name
    }
}

var person = Person(name: "Ed")
print(person.makeAnonymous())

//Sting and Int are structs

let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

//Arrays are structs
var toys = ["Woody"]
toys.count //conta
toys.append("Buzz") //add
toys.firstIndex(of: "Buzz") //Busca a primeira localização do valor
print(toys.sorted()) //Ordena
toys.remove(at: 0) //remove o valor no index indicado



//Day 9
//Initializer - Todas as structs possuem um inicializar default, sendo assim, ao instanciar a struct, nós devemos fornecer um parâmetro inicial.
struct User {
    var name: String
}

var user = User(name: "Filipe")

// Entretanto, é possível criar um inicializador próprio. You don’t write func before initializers, but you do need to make sure all properties have a value before the initializer ends.

struct Man {
    var name: String
    
    init() {
        name = "Anonimous"
        print("Creating a new user")
    }
}

var man = Man()
man.name = "Filipe"

//self - o self é utilizado para se referir é para indicar que aquele nome que representa a propriedade

struct Car {
    var model: String
    
    init(model: String) {
        print("\(model) is a good car")
        self.model = model
    }
}
let car = Car(model: "Mustang")

//Lazy - É uma forma de iniciar uma propriedade de um struct apenas quando ela for iniciada, não necessáriamente na primeira instancia da struct

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct People {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = People(name: "Ed")
ed.familyTree

//static - como cada instância de uma struct cria uma nova cópia desta struct, para que uma propriedade seja estendida para todas estas cópias, sem que haja um nova cópia, basta add static à propriedade.

struct Computer {
    static var count = 0
    var processor: String
    
    init (processor: String) {
        self.processor = processor
        Computer.count += 1
    }
}
let mac = Computer(processor: "intel")
let macM1 = Computer(processor: "M1")

print(Computer.count)

//private - para tornar uma propriedade privada dentro da própria struct, de modo que ela não possa ser acessada fora.

struct Username {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        
        return "My social security number is \(id)"
        
    }
}

var username = Username(id: "123456")
print(username.id) //123456 quando sem private / com private, o username não consegue acessar o .id via username.id



