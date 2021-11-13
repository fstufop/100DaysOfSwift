import UIKit


//class - As class são como struct porém com algumas diferenças
//1 - Diferente das structs as class não possuem um inicializador padrão. Nós devemos criar o inicializador
class Person {
    var name: String
    var age: Int
    func scream(){
        print("Ahhhhhhh")
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let person = Person(name: "Filipe", age: 30)

//Herança - inheritance - Ao herdar as propriedades de uma classe, é herdado o inicializador

class Filipe: Person {
    
    init(name: String) {
        super.init(name: name, age: 30) //Mas é possível criar um inicializador - Caso seja criado o inicializador, o swift faz com que utilizemos a expressão super.init para caso a classe mãe esteja rodando algo importante quando iniciada
    }
    
}

let filipe = Filipe(name: "Eu")
print(filipe.age.description)

//Override func - A sobreposição de métodos nos permite alterar a implementação de makeNoise () para a classe Poodle.

//O Swift exige que usemos a função de substituição em vez de apenas a função ao substituir um método isso impede que você substitua um método acidentalmente, e você receberá um erro se tentar substituir algo que não existe na classe pai:
class Isadora: Person {
    override func scream() {
        print("Woooooooow")
    }
}

let isa = Person(name: "Isadora", age: 32)
isa.scream()

//Final class - a palavra reservada final é utilizada para desabilitar a herança da classe. Assim, não é possivel sobescrever os metodos da classe (override) apenas utiliza-los da forma como foram escritas

final class Mac {
    var model: String
    var year: Int
    
    init(model:String, year: Int) {
        self.model = model
        self.year = year
    }
}
// class MacBook: Mac { }    //não é possível herdar de Mac

class Singer {
    var name = "Taylor Swift"
}

let singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Britney"
print(singer.name)

struct Singers {
    var name = "Taylor Swift"
}

let singers = Singers()
print(singers.name)

var singersCopy = singers
singersCopy.name = "Britney"
print(singers.name)

//deinitializer - Codigo que será rodado quando a classe estiver sendo destruida

class Dude {
    var name = "Filipe"
    
    init() {
        print("\(name) is alive")
    }
    
    func printGreeting() {
        print("Hello, I`m \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let dude = Dude()
    dude.printGreeting()
}
