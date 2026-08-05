//
//  FixedSizeEditorView.swift
//  Example SwiftUI
//
//  Created by Valentin Perignon on 01/08/2024.
//

import InfomaniakRichHTMLEditor
import SwiftUI

struct FixedSizeEditorView: View {
    @State private var html = "<h1>FixedSizeEditorView</h1><p>This editor has a fixed height and is scrollable.</p>"
    @State private var textAttributes = TextAttributes()

    var body: some View {
        RichHTMLEditor(html: $html, editable: true, textAttributes: textAttributes)
            #if canImport(UIKit)
        .editorScrollable(true)
            #endif
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .padding(16)
            .frame(height: 200)
    }
}

#Preview {
    FixedSizeEditorView()
}
