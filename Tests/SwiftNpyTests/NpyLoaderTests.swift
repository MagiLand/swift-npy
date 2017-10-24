import XCTest
@testable import SwiftNpy

class NpyLoaderTests: XCTestCase {
    
    func testLoadBool() {
        do {
            let npy: Npy = try! Npy(data: b1)
            XCTAssertEqual(npy.shape, [2])
            let elements: [Bool] = npy.elements()
            XCTAssertEqual(elements, [true, false])
        }
    }
    
    func testLoadUInt() {
        do {
            let npy: Npy = try! Npy(data: u1)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [UInt8] = npy.elements()
            XCTAssertEqual(elements, [253, 254, 255, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u1)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [UInt] = npy.elements()
            XCTAssertEqual(elements, [253, 254, 255, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u2)
            XCTAssertEqual(npy.shape, [3, 2])
            let elements: [UInt16] = npy.elements()
            XCTAssertEqual(elements, [65533, 65534,65535, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u2)
            XCTAssertEqual(npy.shape, [3, 2])
            let elements: [UInt] = npy.elements()
            XCTAssertEqual(elements, [65533, 65534,65535, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u4)
            XCTAssertEqual(npy.shape, [3, 2])
            let elements: [UInt32] = npy.elements()
            XCTAssertEqual(elements, [4294967293, 4294967294,4294967295, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u4)
            XCTAssertEqual(npy.shape, [3, 2])
            let elements: [UInt] = npy.elements()
            XCTAssertEqual(elements, [4294967293, 4294967294,4294967295, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u8)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [UInt64] = npy.elements()
            XCTAssertEqual(elements, [18446744073709551613, 18446744073709551614, 18446744073709551615, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: u8)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [UInt] = npy.elements()
            XCTAssertEqual(elements, [18446744073709551613, 18446744073709551614, 18446744073709551615, 0, 1, 2])
        }
    }
    
    func testLoadInt() {
        do {
            let npy: Npy = try! Npy(data: i1)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [Int8] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i1)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [Int] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i2)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [Int16] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i2)
            XCTAssertEqual(npy.shape, [2, 3])
            let elements: [Int] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i4)
            XCTAssertEqual(npy.shape, [3, 2])
            let elements: [Int32] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i4)
            XCTAssertEqual(npy.shape, [3, 2])
            let elements: [Int] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i8)
            XCTAssertEqual(npy.shape, [3, 2, 1])
            let elements: [Int64] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: i8)
            XCTAssertEqual(npy.shape, [3, 2, 1])
            let elements: [Int] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
    }
    
    func testLoadFloatDouble() {
        do {
            let npy: Npy = try! Npy(data: f4)
            XCTAssertEqual(npy.shape, [1, 1, 6])
            let elements: [Float] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        do {
            let npy: Npy = try! Npy(data: f8)
            XCTAssertEqual(npy.shape, [1, 6, 1])
            let elements: [Double] = npy.elements()
            XCTAssertEqual(elements, [-3, -2, -1, 0, 1, 2])
        }
        
    }
    
    func testLoadSpecialCase() {
        do {
            let npy: Npy = try! Npy(data: f8_empty)
            XCTAssertEqual(npy.shape, [0])
            let elements: [Double] = npy.elements()
            XCTAssertEqual(elements, [])
        }
        do {
            let npy: Npy = try! Npy(data: i8_scalar)
            XCTAssertEqual(npy.shape, [])
            let elements: [Int] = npy.elements()
            XCTAssertEqual(elements, [3])
        }
    }

    static var allTests = [
        ("testLoadBool", testLoadBool),
        ("testLoadUInt", testLoadUInt),
        ("testLoadInt", testLoadInt),
        ("testLoadFloatDouble", testLoadFloatDouble),
        ("testLoadSpecialCase", testLoadSpecialCase),
    ]
}

/// [true, false]
let b1 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x7c, 0x62, 0x31, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x32, 0x2c, 0x29,
    0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0x01, 0x00
])

/// [[253, 254, 255], [  0,   1,   2]]
let u1 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x7c, 0x75, 0x31, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x32, 0x2c, 0x20,
    0x33, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xfd, 0xfe, 0xff, 0x00, 0x01, 0x02
])

/// [[65533, 65534],[65535,     0],[    1,     2]] big endian
let u2 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3e, 0x75, 0x32, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x33, 0x2c, 0x20,
    0x32, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xff, 0xfd, 0xff, 0xfe, 0xff, 0xff, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02
])

/// [[4294967293, 4294967294],[4294967295,          0],[         1,          2]]
let u4 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3c, 0x75, 0x34, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x33, 0x2c, 0x20,
    0x32, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xfd, 0xff, 0xff, 0xff, 0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
    0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
])

/// [[18446744073709551613, 18446744073709551614, 18446744073709551615],[ 0, 1, 2]] big endian
let u8 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3e, 0x75, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x32, 0x2c, 0x20,
    0x33, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02
])

/// [[-3, -2, -1],[ 0,  1,  2]]
let i1 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x7c, 0x69, 0x31, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x32, 0x2c, 0x20,
    0x33, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xfd, 0xfe, 0xff, 0x00, 0x01, 0x02
])

/// [[-3, -2],[-1,  0],[ 1,  2]]
let i2 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3c, 0x69, 0x32, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x32, 0x2c, 0x20,
    0x33, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xfd, 0xff, 0xfe, 0xff, 0xff, 0xff, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00
])

/// [[-3, -2],[-1,  0],[ 1,  2]] big endian
let i4 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3e, 0x69, 0x34, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x33, 0x2c, 0x20,
    0x32, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xff, 0xff, 0xff, 0xfd, 0xff, 0xff, 0xff, 0xfe, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02
])

/// [[[-3], [-2]],[[-1],  [0]],[ [1],  [2]]] big endian
let i8 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3e, 0x69, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x33, 0x2c, 0x20,
    0x32, 0x2c, 0x20, 0x31, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02
])

/// [[[-3, -2, -1,  0.,  1,  2]]]
let f4 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3c, 0x66, 0x34, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x31, 0x2c, 0x20,
    0x31, 0x2c, 0x20, 0x36, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0x00, 0x00, 0x40, 0xc0, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x80, 0xbf, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x80, 0x3f, 0x00, 0x00, 0x00, 0x40
])

/// [[[-3], [-2], [-1],  [0],  [1],  [2]]] big endian
let f8 = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3e, 0x66, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x31, 0x2c, 0x20,
    0x36, 0x2c, 0x20, 0x31, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0xc0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0xbf, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x3f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
])

let f8_empty = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3c, 0x66, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x30, 0x2c, 0x29,
    0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a
])

let i8_scalar = Data(bytes: [
    0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63,
    0x72, 0x27, 0x3a, 0x20, 0x27, 0x3c, 0x69, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74,
    0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73,
    0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x29, 0x2c, 0x20,
    0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a,
    0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
])
