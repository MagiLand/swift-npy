
import Foundation

let MAGIC_PREFIX = "\u{93}NUMPY"

struct NpyHeader {
    let shape: [Int]
    let dataType: DataType
    let isLittleEndian: Bool
    let isFortranOrder: Bool
    let descr: String
}

func parseHeader(_ data: Data) throws -> NpyHeader {
    
    guard let str = String(data: data, encoding: .ascii) else {
        throw NpyLoaderError.ParseFailed(message: "Failed to load header")
    }
    
    let descr: String
    let isLittleEndian: Bool
    let dataType: DataType
    let isFortranOrder: Bool
    do {
        let separate = str.components(separatedBy: CharacterSet(charactersIn: ", ")).filter { !$0.isEmpty }
        
        guard let descrIndex = separate.index(where: { $0.contains("descr") }) else {
            throw NpyLoaderError.ParseFailed(message: "Header does not contain the key 'descr'")
        }
        descr = separate[descrIndex + 1]
        
        isLittleEndian = descr.contains("<") || descr.contains("|")
        
        guard let dt = DataType.all.filter({ descr.contains($0.rawValue) }).first else {
            fatalError("Unsupported dtype: \(descr)")
        }
        dataType = dt
        
        guard let fortranIndex = separate.index(where: { $0.contains("fortran_order") }) else {
            throw NpyLoaderError.ParseFailed(message: "Header does not contain the key 'fortran_order'")
        }
        
        isFortranOrder = separate[fortranIndex+1].contains("True")
    }
    
    var shape: [Int] = []
    do {
        guard let left = str.range(of: "("),
            let right = str.range(of: ")") else {
                throw NpyLoaderError.ParseFailed(message: "Shape not found in header.")
        }
        
        let substr = str.substring(with: left.upperBound..<right.lowerBound)
        
        let strs = substr.replacingOccurrences(of: " ", with: "")
            .components(separatedBy: ",")
            .filter { !$0.isEmpty }
        for s in strs {
            guard let i = Int(s) else {
                throw NpyLoaderError.ParseFailed(message: "Shape contains invalid integer: \(s)")
            }
            shape.append(i)
        }
    }
    
    return NpyHeader(shape: shape,
                     dataType: dataType,
                     isLittleEndian: isLittleEndian,
                     isFortranOrder: isFortranOrder,
                     descr: descr)
}