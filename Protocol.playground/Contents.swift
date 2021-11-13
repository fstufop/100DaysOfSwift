import UIKit
//Protocol - protocolo define um modelo de métodos, propriedades e outros requisitos a que se adequam a uma determinada tarefa. O protocolo pode então ser adotado por uma classe, estrutura ou enumeração para fornecer uma implementação real desses requisitos. Qualquer tipo que satisfaça os requisitos de um protocolo é considerado em conformidade com esse protocolo.
// A diferença entre class e protocol é que classes são conjunto de dados concretos que estão armazenados na memória. Já protocolos são receitas para se criar algo concreto.
protocol Drivable {
    var topSpeed:  Int { get }
}

protocol Reversible {
    var reverseSpeed: Int { get }
}

protocol Transport {
    var seatCount: Int { get }
}


struct Car: Drivable, Reversible, Transport {
    var topSpeed = 150
    var reverseSpeed: Int = 50
    var seatCount: Int = 5
}

//Protocol inheritance
protocol Cars: Drivable, Reversible, Transport { }

//Extensions - permite add um método a um tipo já existente.

extension Int {
    func square() -> Int {
        return self * self
    }
}

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

let number = 9
number.square()
number.isEven()

//Protocol extensions - Protocolos descrevem quais métodos ou propriedades uma classe, estrutura ou enum deve possuir, mas não determina o código que o método deve realizar. Extensions premitem adicionar códigos dentro de metodos mas apenas em um tipo de dado. Já Protocol extensions permite que seja criado um código em um novo método que pode ser exetendido para outros tipos.
//Array e Sets conformam com um protocolo chamado Collection, assim, é possível criar uma extensão que pode ser utilizado pelos dois tipos.

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

//Protocol-oriented programming
//As extensões de protocolo podem fornecer implementações padrão para nossos próprios métodos de protocolo. Isso facilita a conformidade dos tipos com um protocolo e permite uma técnica chamada “programação orientada a protocolos” - elaborar seu código em torno de protocolos e extensões de protocolo.

protocol Indetifiable {
    var id: String { get set }
    func identify()
}

extension Indetifiable {
    func identify() {
        print("My ID is \(id)")
    }
}


struct User: Indetifiable {
    var id: String
}

let user = User(id: "filipe.teodoro")
user.identify()
