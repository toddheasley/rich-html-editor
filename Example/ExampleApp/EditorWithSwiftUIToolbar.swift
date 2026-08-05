//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.

import InfomaniakRichHTMLEditor
import SwiftUI
import Observation

struct EditorSwiftUIToolbarContent: View {
    @Bindable var textAttributes: TextAttributes

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 4) {
                EditorToolbarButton(systemImage: "bold", isActive: textAttributes.hasBold) {
                    textAttributes.bold()
                }
                EditorToolbarButton(systemImage: "italic", isActive: textAttributes.hasItalic) {
                    textAttributes.italic()
                }
                EditorToolbarButton(systemImage: "underline", isActive: textAttributes.hasUnderline) {
                    textAttributes.underline()
                }
                EditorToolbarButton(systemImage: "strikethrough", isActive: textAttributes.hasStrikethrough) {
                    textAttributes.strikethrough()
                }

                Divider()
                    .frame(height: 20)

                EditorToolbarButton(systemImage: "list.number", isActive: textAttributes.hasOrderedList) {
                    textAttributes.orderedList()
                }
                EditorToolbarButton(systemImage: "list.bullet", isActive: textAttributes.hasUnorderedList) {
                    textAttributes.unorderedList()
                }

                Divider()
                    .frame(height: 20)

                EditorToolbarButton(systemImage: "decrease.indent", isActive: false) {
                    textAttributes.outdent()
                }
                EditorToolbarButton(systemImage: "increase.indent", isActive: false) {
                    textAttributes.indent()
                }

                Divider()
                    .frame(height: 20)

                EditorToolbarButton(systemImage: "arrow.uturn.backward", isActive: false) {
                    textAttributes.undo()
                }
                EditorToolbarButton(systemImage: "arrow.uturn.forward", isActive: false) {
                    textAttributes.redo()
                }
            }
            .padding(.horizontal, 4)
        }
        .scrollIndicators(.hidden)
        .frame(height: 44)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
        .padding(.horizontal)
    }
}

// MARK: - Toolbar button

struct EditorToolbarButton: View {
    let systemImage: String
    let isActive: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.body)
                .frame(width: 36, height: 36)
                .foregroundStyle(isActive ? Color.accentColor : .primary)
                .background(isActive ? Color.accentColor.opacity(0.2) : .clear, in: .rect(cornerRadius: 12))
        }
    }
}

// MARK: -

struct EditorWithSwiftUIToolbar: View {
    @State private var textAttributes = TextAttributes()
    @State private var html = String.sampleHTML

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                RichHTMLEditor(html: $html, editable: true, textAttributes: textAttributes)
                    .padding()
            }
            
            EditorSwiftUIToolbarContent(textAttributes: textAttributes)
        }
    }
}

#Preview {
    EditorWithSwiftUIToolbar()
}
