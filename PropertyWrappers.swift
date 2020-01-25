// Property Wrappers

import UIKit
import SwiftUI

// ===
// * OVERVIEW
// ===
//
// Create Property Wrapper and Class with Properties for Properties
@propertyWrapper
class ClassName
  // properties

// Execute Property Wrapper on Following Property
@ClassName
var attr: String


// ===
// * PROPERTY WRAPPER TYPES
// ===
//
@State
@Binding


// ===
// * @UpperCase
// ===
//
@propertyWrapper
class UpperCase {
  // Implement Wrapped Value | Only `String` Values per `value` Type
  // `private(set)` can only be implemented within Class
  private(set) var value: String = ""

  var wrappedValue: String {
    get { value }
    // `newValue` accessible within `wrappedValue` function of `@propertyWrapper`
    set { value = newValue.uppercased() }
  }
}

struct Driver {
  // Wrap Attribute with PropertyWrapper `@UpperCase`
  @UpperCase
  var license: String
}

extension Driver {
  init(license: String) {
    self.license = license
  }
}

var driver = Driver(license: "abc123")
print(driver.license)

// => "ABC123"


// ===
// * @UrlEncode
// ===
//
@propertyWrapper
class UrlEncode {
  // Implement Wrapped Value | Only `String` Values per `value` Type
  // `private(set)` can only be implemented within Class
  private(set) var value: String = ""

  var wrappedValue: String {
    get { value }
    `newValue` accessible within `wrappedValue` function of `@propertyWrapper`
    set {
      if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
        self.value = url
      }
    }
  }
}

struct Resource {
  // Wrap Attribute with PropertyWrapper `@UrlEncode`
  @UrlEncode
  var city: String
  var url: String {
    "https://www.example.com/api?q=\(city)&appid=12345"
  }
}

extension Resource {
  // Create Resource with `String` instead of `UrlEncode` Type
  init(city: String) {
    self.city = city
  }
}

var resource = Resource(city: "Los Angeles")

print(resource.city)
// => "Los%20Angeles"
// -- City is Encoded and Formatted

print(resource.url)
// => "https://www.example.com/api?q=Los%20Angeles&appid=12345"
// -- URL is Encoded and Formatted
