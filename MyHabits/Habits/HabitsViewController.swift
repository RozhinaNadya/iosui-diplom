//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

class HabitsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var backgroundColor: UIColor = .white
    
    let habitsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor(named: "allBackgroundColor")
        collectionView.toAutoLayout()
        return collectionView
    }()
    
    let cellHabit = "HebitCollectionViewCell"
    let cellProgress = "ProgressCollectionViewCell"
                
    init( color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsHabitsViewController()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewHabit))
        habitsCollectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: cellHabit)
        habitsCollectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: cellProgress)
        habitsCollectionView.dataSource = self
        habitsCollectionView.delegate = self
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Сегодня"
        self.navigationController?.navigationBar.prefersLargeTitles = true
 //       self.habitsTableView.separatorStyle = .none
    }
    
    @objc func addNewHabit() {
        let newHabit = UINavigationController(rootViewController: HabitViewController(color: .white, title: "Создать"))
        present(newHabit, animated: true)
    }
    
    func constraintsHabitsViewController() {
        view.addSubview(habitsCollectionView)
        NSLayoutConstraint.activate([
            habitsCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            habitsCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            habitsCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            habitsCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageTapped(habit: Habit) {
        if habit.isAlreadyTakenToday {
            HabitsStore.shared.track(habit)
        }
    }
}

extension HabitsViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return HabitsStore.shared.habits.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellProgress, for: indexPath) as? ProgressCollectionViewCell else { fatalError() }
            cell.progressView.progress = HabitsStore.shared.todayProgress
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellHabit, for: indexPath) as? HabitCollectionViewCell else { fatalError() }
    //let myHabit = HabitsStore.shared.habits[indexPath.row]
            let myHabit = HabitsStore.shared.habits[indexPath.item]
            cell.habitNameLabel.text = "\(myHabit.name)"
            cell.targetTimeLabel.text = "\(myHabit.dateString)"
            cell.timerLabel.text = "Счётчик: \(myHabit.trackDates.count)"
            cell.checkPointImageView.tintColor = myHabit.color
            cell.habitNameLabel.textColor = myHabit.color
            cell.habitForTap = myHabit
            cell.forColor(habit: myHabit)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width - 32, height: 60)
        } else {
            return CGSize(width: collectionView.bounds.width - 32, height: 130)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 22, left: 6, bottom: 6, right: 6)
    }
}
/*
extension HabitsViewController: HabitsViewControllerDelegate {
    func imageTapped(habit: Habit) {

            if habit.isAlreadyTakenToday {
                HabitsStore.shared.track(habit)
            }
        
    }
}*/
