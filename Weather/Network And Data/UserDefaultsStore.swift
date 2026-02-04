//
//  UserDefaultsStore.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import Foundation

protocol KeyValueStore {
    func save(_ value: Any, key: String)
    func get(key: String) -> Any?
}

final class UserDefaultsStore: KeyValueStore {
    func save(_ value: Any, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    func get(key: String) -> Any? {
        UserDefaults.standard.value(forKey: key)
    }
}
