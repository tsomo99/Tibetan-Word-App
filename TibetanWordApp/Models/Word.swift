import Foundation

struct Word: Identifiable, Codable {
    var id: String            // 改为 var 而不是 let，允许修改
    let tibetan: String       // བཀྲ་ཤིས
    let transliteration: String?   // tashi
    let meaningCN: String     // 祝福
    let meaningEN: String?    // blessing
}
