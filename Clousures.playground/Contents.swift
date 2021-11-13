import UIKit
//Closures
//As funções podem ser atribuidas a uma variável e podem ser chamadas por meio desta variáveis
let driving = {
    print("Enjoy the ride")
}
driving()

//Acepting parameters
let walking = { (place:String) in //O termo "in" serve para que o swift saiba onde terminar os parâmetros e começa  a função
    print("I`m going to \(place)")
}
walking("Goiânia")

//Returning values
//Fuction
func traveling(place: String, when: String) -> String {
    let done = "I make my trip to \(place) on \(when)"
    return done
}
let whereImGoing = traveling(place: "europ", when: "now")
print(whereImGoing)

//Closures
let travaling = { (place: String, when: String) -> String in
    return "I'm going to \(place) \(when)"
}
let message = travaling("Canada","next year")
print(message)

//Using Closures in fuctions
func toDrive(action: () -> Void) { //a função toDrive recebe como parâmetro uma outra função que retorna Vazio
    print("Chegou aqui")
    action()
    print("I arrived")
}
toDrive(action: driving)

//Trailling syntax
toDrive {
    print("deu bom aqui")
}

//accept parameters
func going(toDo: (String) -> Void) {
    print("Chegou aqui")
    toDo("Fala ai")
    print("I arrived")
}

going{  (place: String) in
    print("Im here\(place)")
}

let birthday:(String) -> () = {
    name in
    print(name)
}
birthday("Filipe")


