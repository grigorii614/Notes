//
//  ListNoteViewController.swift
//  Notes
//
//  Created by Grigoriy Zaliva on 4/24/19.
//  Copyright © 2019 ZalStd. All rights reserved.
//

import UIKit

class ListNoteViewController: UIViewController, ListNoteDelegate {

    var presenter = NotePresenter(notesService: NotesService())
    var listNoteView = ListNoteView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        presenter.attachView(view: listNoteView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.updateData()
    }

    //MARK : - configureView
    
    func configureView () {
        self.title = "List of Notes"
        self.view.clipsToBounds = true
        
        self.listNoteView.translatesAutoresizingMaskIntoConstraints = false
        self.listNoteView.delegate = self
        view.addSubview(self.listNoteView)
        self.listNoteView.addConstaintsToFillSuperviewWithPadding(padding: 0)
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    //MARK : - ListNoteDelegate
    
    func showNote(note: Notes) {
        presenter.showNoteViewController(controller: self, note: note)
    }
    
    //MARK : - action
    
    @objc func addTapped() {
        presenter.showNewNote(controller: self)
    }
}
