//
//  CalendarViewController.swift
//  DoOrDie
//
//  Created by m223 on 21.07.2023.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController {
    
    let headerCalendarLabel = UILabel()
    
//    let calendarMenuView = CustomCalendarMenuView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        
        headerCalendarLabel.translatesAutoresizingMaskIntoConstraints = false
        headerCalendarLabel.text = "Calendar"
        headerCalendarLabel.textColor = .black
        headerCalendarLabel.font = UIFont(name: "NunitoSans-Black", size: 20)

        
//        calendarMenuView.delegate = self

//        calendarView.backgroundColor = .yellow
//        // Appearance delegate [Unnecessary]
//        calendarView.calendarAppearanceDelegate = self
//
//        // Animator delegate [Unnecessary]
//        calendarView.animatorDelegate = self
//
//        // Menu delegate [Required]
//        calendarMenu.menuViewDelegate = self
//
//        // Calendar delegate [Required]
//        calendarView.calendarDelegate = self
    }
    
    private func setupConstraints(){
        view.addSubview(headerCalendarLabel)
//        view.addSubview(calendarMenuView)
        //view.addSubview(calendarView)
        
        let constraintOfSides: CGFloat = 30
        
        NSLayoutConstraint.activate([
            headerCalendarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            headerCalendarLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
//            calendarMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
//            calendarMenuView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constraintOfSides),
//            calendarMenuView.topAnchor.constraint(equalTo: headerCalendarLabel.bottomAnchor, constant: 20),
//            calendarMenuView.heightAnchor.constraint(equalToConstant: 44),
//            calendarMenuView.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2)
                    ])
        
    }
    
    private func setupNavigationBar() {
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        //self.calendarMenuView.commitMenuViewUpdate()
        //self.calendarView.commitCalendarViewUpdate()
    }
    
}

//extension CalendarViewController: CVCalendarMenuViewDelegate {
//    func firstWeekday() -> Weekday {
//        // Верните ваш день начала недели (например, .sunday или .monday)
//        return .sunday
//    }
//
//    // Другие методы CVCalendarMenuViewDelegate...
//
//    func didShowPreviousMonth() {
//        // Обработка действий при переключении на предыдущий месяц
//    }
//
//    func didShowNextMonth() {
//        // Обработка действий при переключении на следующий месяц
//    }
//}
