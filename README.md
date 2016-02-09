# EJPractical

[![CI Status](http://img.shields.io/travis/Elton Melo/EJPractical.svg?style=flat)](https://travis-ci.org/Elton Melo/EJPractical)
[![Version](https://img.shields.io/cocoapods/v/EJPractical.svg?style=flat)](http://cocoapods.org/pods/EJPractical)
[![License](https://img.shields.io/cocoapods/l/EJPractical.svg?style=flat)](http://cocoapods.org/pods/EJPractical)
[![Platform](https://img.shields.io/cocoapods/p/EJPractical.svg?style=flat)](http://cocoapods.org/pods/EJPractical)

## Overview

![](gifExample.gif?raw=true "Keyborad screenshot")

## Requirements
iOS 8.0+ 
Xcode 6.4+

## Installation with CocoaPods

EJPractical is available through [CocoaPods](http://cocoapods.org). To install

CocoaPods is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

$ gem install cocoapods

To integrate EJPractical into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'

use_frameworks!


pod 'EJPractical'
```

Then, run the following command:


```ruby
$ pod install
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```Swift
import EJPractical

@IBOutlet weak var textFieldValue: UITextField!

override func layoutSubviews() {
super.layoutSubviews()

textFieldValue.inputAccessoryView = UtilKeyBoard.viewBotoesDeDeControleComConfirmacaoNoTarget(self, metodoAcaoConfirmacao: "keyBoardConfirm", tituloConfirmacao: "Confirmar", targetCancelar: self, metodoAcaoCancelar: "keyBoardCancel", tituloCancelar: "Cancelar", targetEsconderTeclado: self, metodoEsconderTeclado: "turnOffField", corBotao1: "#E92B2A", corBotao2: "#731705", corTextoBotao1Normal: "#63C5F0", corTextoBotao1Highlighted: "#8E8E93", corTextoBotao2Normal: "#FFFFFF", corTextoBotao2Highlighted: "#FFFFFF")
}

func keyBoardConfirm() {

turnOffField()
}

func keyBoardCancel() {

turnOffField()

}

func turnOffField() {

textFieldValue?.resignFirstResponder()
}
```

## Author

Elton Melo, elton.rafaelmelo@gmail.com

## License

EJPractical is available under the MIT license. See the LICENSE file for more info.
