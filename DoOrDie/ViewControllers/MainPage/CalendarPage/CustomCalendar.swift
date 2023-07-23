//import UIKit
//import CVCalendar
//
//class CustomCalendarMenuView: UIView, CVCalendarMenuViewDelegate {
//
//    weak var delegate: CVCalendarMenuViewDelegate?
//
//    func firstWeekday() -> Weekday {
//        .sunday
//    }
//
//    func dayOfWeekTextColor() -> UIColor {
//        .lightGray
//    }
//
//    func dayOfWeekBackGroundColor() -> UIColor {
//        .yellow
//    }
//
//    func dayOfWeekTextUppercase() -> Bool {
//        true
//    }
//
//    func dayOfWeekFont() -> UIFont {
//        UIFont.systemFont(ofSize: 10)
//    }
//
//    func weekdaySymbolType() -> WeekdaySymbolType {
//        .normal
//    }
//
//
//    let menuView = CVCalendarMenuView()
//    let monthLabel = UILabel()
//    let previousMonthButton = UIButton(type: .system)
//    let nextMonthButton = UIButton(type: .system)
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupViews()
//    }
//
//    private func setupViews() {
//        menuView.translatesAutoresizingMaskIntoConstraints = false
//        menuView.backgroundColor = .clear
//        addSubview(menuView)
//
//        monthLabel.translatesAutoresizingMaskIntoConstraints = false
//        monthLabel.textAlignment = .center
//        monthLabel.textColor = .black
//        monthLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        addSubview(monthLabel)
//
//        previousMonthButton.translatesAutoresizingMaskIntoConstraints = false
//        previousMonthButton.setTitle("<<", for: .normal)
//        previousMonthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//      //  previousMonthButton.addTarget(self, action: #selector(previousMonthButtonTapped), for: .touchUpInside)
//        addSubview(previousMonthButton)
//
//        nextMonthButton.translatesAutoresizingMaskIntoConstraints = false
//        nextMonthButton.setTitle(">>", for: .normal)
//        nextMonthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//       // nextMonthButton.addTarget(self, action: #selector(nextMonthButtonTapped), for: .touchUpInside)
//        addSubview(nextMonthButton)
//
//        setupConstraints()
//    }
//
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            menuView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            menuView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            menuView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            menuView.heightAnchor.constraint(equalToConstant: 30),
//
//            monthLabel.topAnchor.constraint(equalTo: menuView.bottomAnchor, constant: 10),
//            monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//
//            previousMonthButton.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor),
//            previousMonthButton.leadingAnchor.constraint(equalTo: leadingAnchor),
//            previousMonthButton.widthAnchor.constraint(equalToConstant: 40),
//            previousMonthButton.heightAnchor.constraint(equalTo: monthLabel.heightAnchor),
//
//            nextMonthButton.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor),
//            nextMonthButton.trailingAnchor.constraint(equalTo: trailingAnchor),
//            nextMonthButton.widthAnchor.constraint(equalToConstant: 40),
//            nextMonthButton.heightAnchor.constraint(equalTo: monthLabel.heightAnchor)
//        ])
//    }
//
//    private func setupAppearance() {
//        if let delegate = delegate {
//            menuView.firstWeekday = delegate.firstWeekday()
//            menuView.dayOfWeekTextColor = (delegate.dayOfWeekTextColor())
//            menuView.dayofWeekBackgroundColor = (delegate.dayOfWeekBackGroundColor())
//            menuView.dayOfWeekTextUppercase = delegate.dayOfWeekTextUppercase()
//            menuView.dayOfWeekFont = (delegate.dayOfWeekFont())
//            menuView.weekdaySymbolType = (delegate.weekdaySymbolType())
//        }
//    }
//
//    func updateMonthLabel(_ month: String) {
//        monthLabel.text = month
//    }
//
////    @objc private func previousMonthButtonTapped() {
////        delegate?.didShowPreviousMonth?()
////    }
////
////    @objc private func nextMonthButtonTapped() {
////        delegate?.didShowNextMonth?()
////    }
//}
