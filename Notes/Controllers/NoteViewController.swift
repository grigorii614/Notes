//
//  NoteViewController.swift
//  Notes
//
//  Created by Grigoriy Zaliva on 4/24/19.
//  Copyright © 2019 ZalStd. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    public var note : Notes?
    
    var presenter = NotePresenter(notesService: NotesService())
    var noteView = NoteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        if note != nil {
            noteView.note = self.note
        }
        
        presenter.attachNoteView(view: noteView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
    }
    
    //MARK : - configureView
    
    func configureView () {
        if note != nil {
            self.title = "Edit Note"
        }
        else {
            self.title = "New Note"
        }
        
        self.view.clipsToBounds = true
        
        self.noteView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.noteView)
        self.noteView.addConstaintsToFillSuperviewWithPadding(padding: 0)
    }
    
    //MARK : - action
    
    @objc func saveData()  {
        let service = NotesService()
        if note != nil {
            service.updateNote(note: note!, text: self.noteView.textView.text)
        } else {
            service.saveNote(text: self.noteView.textView.text)
        }
        
        presenter.backToPrevView(controller: self)
    }
}
