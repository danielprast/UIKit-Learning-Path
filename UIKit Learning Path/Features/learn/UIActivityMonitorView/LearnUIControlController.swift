//
//  LearnUIControlController.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 13/12/21.
//

import UIKit

class LearnUIControlController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inspectControllerName(type: LearnUIControlController.self)
        
        view.backgroundColor = .white
        
//        createUISearchBar()
//        createUISwitch()
//        createUIStepper()
//        createUIPageControl()
//        createDatePicker()
//        createUISlider()
//        createUISegmentedControl()
        createUIButton()
    }
    
    // MARK: - UIButton
    
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .infoDark)
    let button3 = UIButton(type: .custom)
    let button4 = MyButton(type: .custom)
    
    fileprivate func createUIButton() {
        button1.tag = 1
        button1.setTitle("Button1", for: .normal)
        button1.setTitle("Button Highlighted", for: .highlighted)
        button1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button1)
        let anchor_button1_1 = button1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let anchor_button1_2 = button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        NSLayoutConstraint.activate([anchor_button1_1, anchor_button1_2])
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        button2.tag = 2
        let button2Container = UIView(frame: .zero)
        button2Container.backgroundColor = .green
        button2Container.translatesAutoresizingMaskIntoConstraints = false
        button2.showsTouchWhenHighlighted = true
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2Container.addSubview(button2)
        view.addSubview(button2Container)
        let anchor_button2Container_1 = button2Container.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20)
        let anchor_button2Container_2 = button2Container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let anchor_button2Container_3 = button2Container.widthAnchor.constraint(equalToConstant: 30)
        let anchor_button2Container_4 = button2Container.heightAnchor.constraint(equalToConstant: 30)
        let anchor_button2_1 = button2.centerYAnchor.constraint(equalTo: button2Container.centerYAnchor)
        let anchor_button2_2 = button2.centerXAnchor.constraint(equalTo: button2Container.centerXAnchor)
        NSLayoutConstraint.activate([
            anchor_button2_1,
            anchor_button2_2,
            anchor_button2Container_1,
            anchor_button2Container_2,
            anchor_button2Container_3,
            anchor_button2Container_4
        ])
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        button3.tag = 3
        button3.setTitle("Button3", for: .normal)
        button3.setTitle("Button3 Highlighted", for: .highlighted)
        button3.setImage(UIImage(named: "earth")!, for: .normal)
        button3.setTitleColor(.blue, for: .normal)
        button3.setTitleColor(.cyan, for: .highlighted)
        button3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button3)
        let anchor_button3_1 = button3.topAnchor.constraint(equalTo: button2Container.bottomAnchor, constant: 20)
        let anchor_button3_2 = button3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        NSLayoutConstraint.activate([anchor_button3_1, anchor_button3_2])
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        button4.tag = 4
        button4.setTitle("Button4", for: .normal)
        button4.setBackgroundImage(UIImage(named: "ruler")!, for: .normal)
        button4.setTitleColor(.blue, for: .normal)
        button4.setTitleColor(.red, for: .highlighted)
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.contentEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        view.addSubview(button4)
        let anchor_button4_1 = button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 20)
        let anchor_button4_2 = button4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        NSLayoutConstraint.activate([anchor_button4_1, anchor_button4_2])
        button4.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 5
        button.setTitle("Sign Up With Facebook", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        //button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc fileprivate func buttonTapped(_ sender: UIButton) {
        print("🤯 Button did tap on tag: \(sender.tag)")
        print("🥶 Button signUpButton size: \(signUpButton.frame)")
    }
    
    // MARK: - UISegmentedControl
    
    let segmentedControl = UISegmentedControl(items: [
        UIImage(named: "earth")!.withRenderingMode(.alwaysOriginal),
        "Mars",
        "Venus"
    ])
    
    fileprivate func createUISegmentedControl() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueDidChange(_:)), for: .valueChanged)
    }
    
    @objc fileprivate func segmentedControlValueDidChange(_ sender: UISegmentedControl) {
        print("🎯 value: \(sender.selectedSegmentIndex)")
    }
    
    // MARK: - UI Slider
    
    let slider = UISlider(frame: .zero)
    
    fileprivate func createUISlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.setValue(40, animated: false)
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .yellow
        slider.setThumbImage(UIImage(named: "space-shuttle")!, for: .normal)
        slider.setThumbImage(UIImage(named: "rocket")!, for: .highlighted)
        slider.minimumValueImage = UIImage(named: "earth")!
        slider.maximumValueImage = UIImage(named: "planets")!
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
    }
    
    @objc fileprivate func sliderValueDidChange(_ sender: UISlider) {
        print("Slider value: \(slider.value)")
    }
    
    // MARK: - UI Date Pikcer
    
    let datePicker = UIDatePicker(frame: .zero)
    
    fileprivate func createDatePicker() {
        datePicker.datePickerMode = .date
        var dateComponents = DateComponents()
        dateComponents.year = 2016
        dateComponents.month = 11
        dateComponents.day = 28
        let userCalendar = Calendar.current
        let dateTime = userCalendar.date(from: dateComponents)!
        datePicker.minimumDate = Date(timeIntervalSinceReferenceDate: dateTime.timeIntervalSinceReferenceDate)
        datePicker.timeZone = TimeZone(identifier: "Asia/Jakarta")
        datePicker.locale = Locale(identifier: "id")
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
    }
    
    @objc fileprivate func datePickerValueDidChange(_ sender: UIDatePicker) {
        print(sender.date)
    }
    
    // MARK: - UI Page Control
    
    let pageControl = UIPageControl(frame: .zero)
    
    fileprivate func createUIPageControl() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 2
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(pageControlValueDidChange(_:)), for: .valueChanged)
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: stepper2.bottomAnchor, constant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc fileprivate func pageControlValueDidChange(_ sender: UIPageControl) {
        print(sender.currentPage)
    }
    
    // MARK: - UIStepper
    let stepper = UIStepper(frame: .zero)
    let stepper2 = UIStepper(frame: .zero)
    
    fileprivate func createUIStepper() {
        stepper.addTarget(self, action: #selector(stepperValueDidChange(_:)), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepper)
        
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: switchUi.bottomAnchor, constant: 20),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let decrementImage = UIImage(named: "chevron-sign-left")!
        let incrementImage = UIImage(named: "chevron-sign-to-right")!
        stepper2.addTarget(self, action: #selector(stepperValueDidChange(_:)), for: .valueChanged)
        stepper2.setDecrementImage(decrementImage, for: .normal)
        stepper2.setIncrementImage(incrementImage, for: .normal)
        stepper2.setDividerImage(UIImage(named: "vertical-ellipsis")!, forLeftSegmentState: .normal, rightSegmentState: .normal)
        stepper2.minimumValue = 1
        stepper2.maximumValue = 10
        stepper2.value = 8
        stepper2.stepValue = 1
        stepper2.setBackgroundImage(UIImage(named: "tent")!, for: .normal)
        stepper2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stepper2)
        
        NSLayoutConstraint.activate([
            stepper2.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 20),
            stepper2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func stepperValueDidChange(_ sender: UIStepper) {
        print("Sender value: \(sender.value)")
    }
    
    // MARK: - UI Switch
    
    let switchUi = UISwitch(frame: .zero)
    
    fileprivate func createUISwitch() {
        switchUi.onTintColor = .red
        switchUi.tintColor = .yellow
        switchUi.thumbTintColor = .blue
        switchUi.setOn(true, animated: false)
        switchUi.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchUi.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(switchUi)
        
        NSLayoutConstraint.activate([
            switchUi.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            switchUi.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func switchValueDidChange(_ sender: UISwitch) {
        if (sender.isOn) {
            print("is on")
        } else {
            print("is off")
        }
    }
    
    // MARK: - UI Search Bar
    
    let searchBar = UISearchBar(frame: .zero)
    
    fileprivate func createUISearchBar() {
        searchBar.prompt = "Prompt"
        searchBar.searchFieldBackgroundPositionAdjustment = UIOffset(horizontal: 0, vertical: 20)
        searchBar.placeholder = "Placeholder"
        searchBar.barStyle = .black
        searchBar.barTintColor = .yellow
        searchBar.showsSearchResultsButton = true
        searchBar.showsCancelButton = true
        //searchBar.showsBookmarkButton = true
        //searchBar.showsLargeContentViewer = true
        searchBar.setImage(UIImage(named: "phone")!, for: .search, state: .normal)
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["BitCoin", "Etherum", "Monero"]
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UI Search Bar Delegate
extension LearnUIControlController:  UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Mulai ngetik...")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("text did change")
        print(searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("should change")
        print(range)
        print("Test: \(text)")
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("result list")
    }
}
