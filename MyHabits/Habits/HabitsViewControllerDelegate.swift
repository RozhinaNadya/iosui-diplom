//
//  HabitsViewControllerDelegate.swift
//  MyHabits
//
//  Created by Надежда on 16.03.2022.
//

import UIKit
//пока не нужно
protocol HabitsViewControllerDelegate: AnyObject {
    func imageTapped(habit: Habit)
}
