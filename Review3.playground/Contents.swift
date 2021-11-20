import UIKit

//didSet
struct Personas {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylors = Personas(clothes: "T-shirts")
taylors.clothes = "short skirts"

//Static properties - Torna uma propriedade ou método comum para qualquer instância. Dessa forma, ao instanciar um objeto da struct, apenas esta propriedade estática pode ser acessa de maneira direta pela estrutura. Assim as demais propriedades só são acessadas a partir da instância do objeto.
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)

//Access control

//public isso significa que todos podem ler e escrever a propriedade.
//Internal: isso significa que apenas o seu código Swift pode ler e gravar a propriedade. Se você enviar seu código como uma estrutura para outras pessoas usarem, elas não poderão ler a propriedade.
//fileprivate: isso significa que apenas o código Swift no mesmo arquivo que o tipo pode ler e gravar a propriedade.
//private: esta é a opção mais restritiva e significa que a propriedade está disponível apenas dentro de métodos que pertencem ao tipo ou suas extensões.


//Polymorphism and typecasting

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive] //Apesar de taylorSwift, fearless an iTunesLives serem tipos diferentes, o fato de herdarem da mesma classe, permite com que os objetos possam funcionar como suas classes pai.

for album in allAlbums {
    print(album.getPerformance())
}
//Se tentarmos acessar a propriedade album.studio, o swift não conseguirá pois ela entende que o album é do tipo Album, pois album é um array de Albums. Entretanto, nós sabemos que album é um array de subclasses de Album: StudioAlbum e LiveAlbum. Para resolver este problema existe o typecasting (as? ou as!) que converte um tipo em outro. Na verdade não há a conversão de fato mas sim a correção do tipo

//typeCasting
//as? e as!, conhecido como downcasting opcional e downcasting forçado. O primeiro significa "Acho que essa conversão pode ser verdadeira, mas pode falhar", e o segundo significa "Eu sei que essa conversão é verdadeira, e estou feliz que meu aplicativo trave se eu estiver errado".

for album in allAlbums {
    let studioAlbum = album as? StudioAlbum
    print(studioAlbum ?? "")
}

for album in allAlbums {
    print(album.getPerformance())
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

//Convertendo um tipo em outro
let number = 5
let text = number as! String //Este código não é possivel pois não é possivel converter o tipo do valor sem converte-lo efetivamente, logo a maneira certa de converter valores é criar uma nova variável do tipo desejado alimentando-a com a variável a ser convertida.

let numberr = 5
let string = String(number)
//Isso só funciona para alguns dos tipos de dados internos da Swift: você pode converter inteiros e flutuadores em strings e vice-versa, por exemplo, mas se você criou duas estruturas personalizadas, a Swift não pode magicamente converter uma para a outra - você mesmo precisa escrever esse código.

