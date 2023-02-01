//
//  AddEventViewModel.swift
//  CountdownEvent
//
//  Created by Александр Новиков on 31.01.2023.
//

import Foundation

final class AddEventViewModel {
    
    let title = "Добавить"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Событие", subtitle: "", placeholder: "Название события")),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Дата", subtitle: "", placeholder: "Добавьте дату"))
        ]
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        print("tappedDone")
    }
}
