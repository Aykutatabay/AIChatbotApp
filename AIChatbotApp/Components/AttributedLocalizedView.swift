//
//  AttributedLocalizedView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 22.06.2025.
//

import SwiftUI

struct AttributedLocalizedText: View {
    let parts: [Text]

    init(localizedKey: String, arguments: [String]) {
        let raw = String(format: NSLocalizedString(localizedKey, comment: ""), arguments: arguments)
        self.parts = AttributedLocalizedText.parseStyledText(raw)
    }

    var body: some View {
        parts.reduce(Text(""), +)
    }

    private static func parseStyledText(_ text: String) -> [Text] {
        var result: [Text] = []
        let scanner = Scanner(string: text)
        scanner.charactersToBeSkipped = nil

        while !scanner.isAtEnd {
            if let plain = scanner.scanUpToString("[[") {
                result.append(Text(plain))
            }
            if scanner.scanString("[[") != nil {
                if let tag = scanner.scanUpToString("]]"), scanner.scanString("]]") != nil {
                    let endTag = "[[/\(tag)]]"
                    if let inner = scanner.scanUpToString(endTag), scanner.scanString(endTag) != nil {
                        let styledText: Text
                        switch tag {
                        case "bold":
                            styledText = Text(inner).bold()
                        case "italic":
                            styledText = Text(inner).italic()
                        case "highlight":
                            styledText = Text(inner).foregroundColor(.red)
                        case "boldBlue":
                            styledText = Text(inner)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.blue)
                        case "boldAccent":
                            styledText = Text(inner)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.accent)
                        default:
                            styledText = Text(inner)
                        }
                        result.append(styledText)
                    }
                }
            }
        }

        return result
    }
}


class AttributedLocalizedLabel: UILabel {
    func setLocalizedText(_ key: String, arguments: [String]) {
        let raw = String(format: NSLocalizedString(key, comment: ""), arguments: arguments)
        self.attributedText = Self.parseStyledText(raw)
    }

    private static func parseStyledText(_ text: String) -> NSAttributedString {
        let result = NSMutableAttributedString()
        let scanner = Scanner(string: text)
        scanner.charactersToBeSkipped = nil

        while !scanner.isAtEnd {
            if let plain = scanner.scanUpToString("[[") {
                result.append(NSAttributedString(string: plain))
            }

            if scanner.scanString("[[") != nil {
                if let tag = scanner.scanUpToString("]]"), scanner.scanString("]]") != nil {
                    let closingTag = "[[/\(tag)]]"
                    if let inner = scanner.scanUpToString(closingTag), scanner.scanString(closingTag) != nil {
                        let styled: NSAttributedString
                        switch tag {
                        case "bold":
                            styled = NSAttributedString(
                                string: inner,
                                attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)]
                            )
                        case "italic":
                            styled = NSAttributedString(
                                string: inner,
                                attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.labelFontSize)]
                            )
                        case "highlight":
                            styled = NSAttributedString(
                                string: inner,
                                attributes: [.foregroundColor: UIColor.red]
                            )
                        case "boldBlue":
                            styled = NSAttributedString(
                                string: inner,
                                attributes: [
                                    .font: UIFont.boldSystemFont(ofSize: 16),
                                    .foregroundColor: UIColor.blue
                                ]
                            )
                        default:
                            styled = NSAttributedString(string: inner)
                        }

                        result.append(styled)
                    }
                }
            }
        }

        return result
    }
}

