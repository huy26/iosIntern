//
//  WorkView.swift
//  firebase-test
//
//  Created by Mac on 9/6/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class WorkView: UIViewController  {
    
  

    @IBOutlet weak var TodoTableView: UITableView!
    @IBOutlet var UIscrollView: UIView!
    @IBOutlet weak var taskPlaceHolder: UITextField!
    
    @IBOutlet weak var menubarView: UICollectionView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    //@IBOutlet weak var TableViewHeader: UIView!
   // @IBOutlet weak var TableViewFooter: UIView!
    
    
    var data = ["test","test","test"]
    var titleTask = ["Movie","List","Music","Game"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
        /*
        TodoTableView.dataSource = self
        TodoTableView.delegate = self
        
        TodoTableView.tableFooterView = UIView()
        TodoTableView.layer.borderWidth = 1
        TodoTableView.layer.borderColor = UIColor.purple.cgColor
        //TodoTableView.tableHeaderView = TableViewHeader
        //TodoTableView.tableFooterView = TableViewFooter
        
        taskPlaceHolder.placeholder = "Enter task here"
        
        menubarView.dataSource = self
        menubarView.delegate = self
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        menubarView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
       
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "TaskCell")
        
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        setupHorizontalBar()
 
        
    }

    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar(){
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.red
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        UIscrollView.addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: menubarView.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: menubarView.bottomAnchor).isActive  = true
        horizontalBarView.widthAnchor.constraint(equalTo: menubarView.widthAnchor,multiplier: 1/7).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    @IBAction func OnNewTask(_ sender: UIButton) {
        data.append(taskPlaceHolder.text!)
        TodoTableView.reloadData()
        textFieldDidBeginEditing(textField: taskPlaceHolder)
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
}

//////////////////////////////////////////////COLLECTION VIEW///////////////////////////////////
//////////////////////////////////////////////COLLECTION VIEW///////////////////////////////////
//////////////////////////////////////////////COLLECTION VIEW///////////////////////////////////
extension WorkView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 4
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let color: [UIColor] = [.blue,.green,.red,.black]
        if collectionView == self.menubarView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? MenuCell
            cell?.menucell.text = titleTask[indexPath.row]
            //cell?.backgroundColor = color[indexPath.item]
            cell?.backgroundColor = UIColor.white
            return cell!
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionview", for: indexPath)
            cell.backgroundColor = color[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.menubarView {
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height)
        } else {
            print("Collection view size \(collectionView.frame.width) \(collectionView.frame.height)")
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        let x: CGFloat = CGFloat(CFloat(indexPath.item)) * collectionView.frame.width
        horizontalBarLeftAnchorConstraint?.constant = x/4
        UIView.animate(withDuration: 0.75){
        }
         */
        scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/4
    }
    
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / scrollView.frame.width
        
        //print(targetContentOffset.pointee.x)
        //print(view.frame.width)
        //print(targetContentOffset.pointee.x / view.frame.size.width)
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menubarView.selectItem(at: indexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
}

//////////////////////////////////////////////TABLE VIEW///////////////////////////////////
//////////////////////////////////////////////TABLE VIEW///////////////////////////////////
//////////////////////////////////////////////TABLE VIEW///////////////////////////////////
extension WorkView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TodoTableView.dequeueReusableCell(withIdentifier: "TodoCell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Hint", message: "You have selected row", preferredStyle:.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(alertAction)
        present(alert,animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            data.remove(at: indexPath.row)
            TodoTableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            
        }
    }
}
*/
