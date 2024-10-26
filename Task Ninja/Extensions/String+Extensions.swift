//
//  String+Extensions.swift
//  Task Ninja
//
//  Created by Brandon Jones on 10/26/24.
//

import Foundation


extension String {
  var isEmptyOrWhitespace: Bool {
    return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}
