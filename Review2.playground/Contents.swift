import UIKit

func favoriteAlbum(name: String) {
    print("My favorit is \(name)")
}

favoriteAlbum(name: "Nevermind")
favoriteAlbum(name: "Fearless")


func printAlbumRelease(name: String, year: Int) {
    print("The album \(name) was released in \(year)")
}

printAlbumRelease(name: "live Era", year: 2000)

func countLettersInString(string: String) {
    print("The string \(string) has \(string.count) letters")
}

countLettersInString(string: "Hello")


func albumIsTaylors(_ name: String) -> Bool {
    switch name {
    case "Taylor Swift":
        return true
    case "Fearless":
        return true
    default:
        return false
    }
}

//Optionals
func getHatersStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status = getHatersStatus(weather: "rainy")

if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
} else {
    // in case you want an else block, here you go
}

func takeHaterAction(status: String) {
    if status == "Hate"{
        print("Hating")
    }
}

if let haterStatus = getHatersStatus(weather: "rainy") { //Se existir algo no getHatersStatus, o takeHatersAction vai utiliza-lo como parâmetro para executar o código
    takeHaterAction(status: haterStatus)
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int? {
    for i in 0 ..< array.count {
        if array[i] == string {
            return i
        }
    }

    return nil
}
let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

//Os principais momentos em que você encontrará opcionais implicitamente desembrulhados é quando você está trabalhando com elementos da interface do usuário no UIKit no iOS ou AppKit no macOS. Estes precisam ser declarados antecipadamente, mas você não pode usá-los até que tenham sido criados - e a Apple gosta de criar elementos da interface do usuário no último momento possível para evitar qualquer trabalho desnecessário. Ter que desembrulhar continuamente valores que você definitivamente sabe que estarão lá é irritante, então estes são feitos implicitamente desembrulhados.

//enum

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}
func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}


func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006) ?? "unknow"
print("The album is \(album)")

//struct - copiam por objeto - fazem cópias diferentes das propriedades e métodos - possuem inicializador automático - não herdam
struct Person {
    var clothes: String
    var shoes: String
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)
//classes - copiam por referência - replicam as referências das propriedades e métodos - não possuem inicializado automático - herdam
// Declarando as duas propriedades como String, significa que elas absolutamente devem ter um valor. Isso funcionava bem em uma estrutura porque o Swift produz automaticamente um inicializador de membro para nós que nos forçou a fornecer valores para as duas propriedades, mas isso não acontece com as classes, então o Swift não pode ter certeza de que receberão valores.

//Existem três soluções: tornar os dois valores strings opcionais,fornecer a eles os valores padrão ou escrever nosso próprio inicializador. A primeira opção é desajeitada porque introduz opcionais em todo o nosso código onde eles não precisam estar. A segunda opção funciona, mas é um pouco inútil, a menos que esses valores padrão sejam realmente usados. Isso deixa a terceira opção, e realmente é a certa: escrever nosso próprio inicializador.

class Persona {
    var clothes: String
    var shoes: String

    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

//Herança - Uma classe pode herdar de outra
class Singer { //superclass
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer { //subclass
    override func sing() { //para sobrescrever um método de uma superclass - This means "I know this method was implemented by my parent class, but I want to change it for this subclass."
        print("tche, rere, rere")
    }
}
class HeavyMetal: Singer {
    var scream: String
    
    init(name: String, age: Int, scream: String) {
        self.scream = scream
        super.init(name: name, age: age)
    }
    override func sing() {
        print("AAAhhhhhhhhh")
    }
}
