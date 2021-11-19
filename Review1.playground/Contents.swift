import UIKit

//O ideal é sempre armazenar um valor como uma constante "let". Isso garante que se você não altere acidentalmente este valor. Se por algum motivo, durante o código isso precise ser feito, o swift irá indicar que a constante deve ser alterada para variável "var".

var name = "Filipe" //String of caracteres
name = "Isadora"

//Type annotation

var nome: String
nome = "Isa"

var age: Int
age = 25

//Double possui uma acuracia bem maior que o tipo Float
var latitude: Double
latitude = 361.166667 //361.166667

var longitude: Float
longitude = 361.166667 //361.1667

//A inferência de tipo é sempre preferível
var long = 361.166667

//Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

a += 4
a -= 4
a /= 4

//Comparaçoes retornam sempre boleanos
var b = 5
var c = 10
a > c
a >= c
a == c
a != c

var isTrue = true
!isTrue

//Interpolação
var man = "Tim Mcgraw"
"Your name is \(man)"

"You are \(age), in next \(age) year, you will have \(age * 2)"

//Arrays

var evenNumbers = [2, 4, 6, 8]
var songs = ["Relecário","Luz dos Olhos","Segundo Sol"]

songs[0]
songs[1]
songs[2]

type(of: songs)

var bands = [String]()
bands.append("Guns")
bands

var songs2 = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs3 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs2 + songs3
both += ["Everything has Changed"]

//Dictionaries - Coleção de valores com chave de acesso

//var person = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
var taylor = ["first": "Taylor",
              "middle" : "Alison",
              "last" : "Swift",
              "month" : "December",
              "webSite": "taylorswift.com"]

taylor["first"]

//Conditional - Checar uma condição if, else if
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "plays"
} else {
    action = ""
}

var stayOutTooLate = true
var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

if !stayOutTooLate || !nothingInBrain {
    action = "clever"
}

//Loops
//For
//Bad way
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

//Good way
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake,"
}
print(str)

var people = ["players","haters","heart-breakers","fakers"]
var actions = ["play","hate","break","fake"]

for i in 0 ..< people.count {
    var riff = "\(people[i]) gonna"
    
    for _ in 1...5 {
        riff += " \(actions[i]),"
    }
    print(riff)
}

//While e repeat - Loop infinito até que alguma condição seja atendida
//A diferença básica é que o while testa a condição e depois executa o código. Já o repeat, executa o código depois testa a condição.

var counter = 0

while true {
    print("Counter is now \(counter)")
    
    counter += 1
    
    if counter == 556 {
        break
    }
}

repeat {
    print("Counter is now  \(counter)")
    
    counter += 1
} while counter <= 560

//continue - Pula a contagem caso atenda a condição e continua o loop

for people in people {
    if people == "haters" {
        continue
    }
    print(people)
}

//Switch case

let liveAlbums = 4

switch liveAlbums {
case 0...1:
    print("You're just starting out")
case 2...3:
    print("You're have a little")
case 4...9:
    print("You're have a lot")
default:
    print("Some thing wrong")
}


