import UIKit

//optional - Optional é um tipo existente no swift para representar ausência de valor em uma variável.
var age: Int? = nil
age = 38
print(age ?? 0)

//unwrapping optionals - Como a variável pode estar vazia, para que são seja exibido o valor nil é necessário desembrulhar o opicional com um if let, guard let ou mesmo um ternário.
var name1: String? = nil
name1 = "Filipe"
print(name1 != nil ? print("Meu nome é \(String(describing: name1))") : print("There is no name"))

//guard let - Alternativa ao if let que possibilita a reutilização do valor desembrulhado dentro da função - Ele retorna de uma função, loop ou condicional.
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)")
}
greet("Filipe")
let name = "Filipe"
func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}
printMeaningOfLife()
func printMeaningOfLife1() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}
printMeaningOfLife1()

//Force unwrapping - operador que garante que o valor existe e pode ser convertido
let str = "5"
let num = Int(str)

//Nil coalescing operator
func username(for id: Int) -> String? {
    if id == 1 {
        return "Filipe"
    } else {
        return nil
    }
}
// Outra maneira de desembrulhar é utilizando o operador ??
let user = username(for: 2) ?? "Anonymous"
print(user)

//Se alguma propriedade for opcional a.b?.c - se b for nil, o resto da linha não é executada
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
