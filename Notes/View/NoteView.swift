//
//  NoteView.swift
//  Notes
//
//  Created by Grigoriy Zaliva on 4/24/19.
//  Copyright © 2019 ZalStd. All rights reserved.
//

import UIKit

class NoteView : UIView, UITextViewDelegate {
    
    let textView = UITextView()
    var noteService = NotesService()
    public var note : Notes?
    
    func createTextView() {
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textView)
        textView.addConstaintsToFillSuperviewWithPadding(padding: 5)
    }
    
    func updateData()  {
        if note != nil {
            textView.text = note?.text
        }
    }
}
