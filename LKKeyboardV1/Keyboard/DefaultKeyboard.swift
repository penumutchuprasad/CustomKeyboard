//
//  DefaultKeyboard.swift
//  RupeSoKeyboardV1
//
//  Created by Leela Prasad on 03/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import Foundation

func defaultKeyboard() -> Keyboard {
    let defaultKeyboard = Keyboard()
    
    for key in ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 0, page: 0)
    }
    
    for key in ["A", "S", "D", "F", "G", "H", "J", "K", "L"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 1, page: 0)
    }
    
    let keyModel = Key(.shift)
    defaultKeyboard.add(key: keyModel, row: 2, page: 0)
    
    for key in ["Z", "X", "C", "V", "B", "N", "M"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 2, page: 0)
    }
    
    let backspace = Key(.backspace)
    defaultKeyboard.add(key: backspace, row: 2, page: 0)
    
    let keyModeChangeNumbers = Key(.modeChange)
    keyModeChangeNumbers.uppercaseKeyCap = "123"
    keyModeChangeNumbers.toMode = 1
    defaultKeyboard.add(key: keyModeChangeNumbers, row: 3, page: 0)
    
    let keyboardChange = Key(.keyboardChange)
    defaultKeyboard.add(key: keyboardChange, row: 3, page: 0)
    
    let pamentKey = Key(.payment)
    defaultKeyboard.add(key: pamentKey, row: 3, page: 0)
    
    let space = Key(.space)
    space.uppercaseKeyCap = "space"
    space.uppercaseOutput = " "
    space.lowercaseOutput = " "
    defaultKeyboard.add(key: space, row: 3, page: 0)
    
    let returnKey = Key(.return)
    returnKey.uppercaseKeyCap = "return"
    returnKey.uppercaseOutput = "\n"
    returnKey.lowercaseOutput = "\n"
    defaultKeyboard.add(key: returnKey, row: 3, page: 0)
    
    for key in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 0, page: 1)
    }
    
    for key in ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 1, page: 1)
    }
    
    let keyModeChangeSpecialCharacters = Key(.modeChange)
    keyModeChangeSpecialCharacters.uppercaseKeyCap = "#+="
    keyModeChangeSpecialCharacters.toMode = 2
    defaultKeyboard.add(key: keyModeChangeSpecialCharacters, row: 2, page: 1)
    
    for key in [".", ",", "?", "!", "'"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 2, page: 1)
    }
    
    defaultKeyboard.add(key: Key(backspace), row: 2, page: 1)
    
    let keyModeChangeLetters = Key(.modeChange)
    keyModeChangeLetters.uppercaseKeyCap = "ABC"
    keyModeChangeLetters.toMode = 0
    defaultKeyboard.add(key: keyModeChangeLetters, row: 3, page: 1)
    
    defaultKeyboard.add(key: Key(keyboardChange), row: 3, page: 1)
    
    defaultKeyboard.add(key: Key(pamentKey), row: 3, page: 1)
    
    defaultKeyboard.add(key: Key(space), row: 3, page: 1)
    
    defaultKeyboard.add(key: Key(returnKey), row: 3, page: 1)
    
    for key in ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 0, page: 2)
    }
    
    for key in ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "•"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 1, page: 2)
    }
    
    defaultKeyboard.add(key: Key(keyModeChangeNumbers), row: 2, page: 2)
    
    for key in [".", ",", "?", "!", "'"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        defaultKeyboard.add(key: keyModel, row: 2, page: 2)
    }
    
    defaultKeyboard.add(key: Key(backspace), row: 2, page: 2)
    
    defaultKeyboard.add(key: Key(keyModeChangeLetters), row: 3, page: 2)
    
    defaultKeyboard.add(key: Key(keyboardChange), row: 3, page: 2)
    
    defaultKeyboard.add(key: Key(pamentKey), row: 3, page: 2)
    
    defaultKeyboard.add(key: Key(space), row: 3, page: 2)
    
    defaultKeyboard.add(key: Key(returnKey), row: 3, page: 2)
    
    return defaultKeyboard
}
