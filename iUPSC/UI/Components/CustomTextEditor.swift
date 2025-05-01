//
//  CustomTextEditor.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct CustomTextEditor: UIViewRepresentable {
    @Binding var text: String
    var font: UIFont = UIFont.systemFont(ofSize: 16)
    var isEditable: Bool = true
    var autoCorrectionDisabled: Bool = true
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = font
        textView.isEditable = isEditable
        textView.autocorrectionType = autoCorrectionDisabled ? .no : .default
        textView.delegate = context.coordinator
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.layer.cornerRadius = 8
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextEditor
        
        init(_ parent: CustomTextEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}
