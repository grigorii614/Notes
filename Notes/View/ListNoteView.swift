//
//  ListNoteView.swift
//  Notes
//
//  Created by Grigoriy Zaliva on 4/24/19.
//  Copyright © 2019 ZalStd. All rights reserved.
//

import UIKit

protocol ListNoteDelegate {
    func showNote(note : Notes)
}

class ListNoteView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    let service = NotesService()
    var delegate : ListNoteDelegate?
    var tableView = UITableView()
    var indentifire = "MyCell"
    
    var noteService = NotesService()
    var notesArray = [Any]()
    
    //MARK : - createTable
    
    public func createTable() {
        self.tableView = UITableView()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addSubview(tableView)
        self.tableView.addConstaintsToFillSuperviewWithPadding(padding: 0)
    }
    
    public func updateView() {
        notesArray = self.noteService.getNotes()
        
        tableView.reloadData()
    }
    
    //MARK : - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        let note : Notes = notesArray[indexPath.row] as! Notes
        cell.textLabel?.text = String((note as AnyObject).text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note : Notes = notesArray[indexPath.row] as! Notes
         _ = delegate?.showNote(note: note)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note : Notes = notesArray[indexPath.row] as! Notes
            service.removeNote(note: note)
            
            self.updateView()
        }
    }
}
