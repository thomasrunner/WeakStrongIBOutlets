//
//  ViewController.swift
//  WeakStrongIBOutlets
//
//  Created by Thomas on 2018-11-07.
//  Copyright © 2018 Thomas Lock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var weakIBOutletLabel: UILabel!
    @IBOutlet var strongIBOutletLabel: UILabel!
    
    @IBOutlet weak var weakIBOutletPropertyLabel: UILabel!
    @IBOutlet weak var weakIBOutletStrongPropertyLabel: UILabel!
    
    @IBOutlet weak var addWeakIBOutletButton: UIButton!
    @IBOutlet weak var removeWeakIBOutletButton: UIButton!
    @IBOutlet weak var changeWeakIBOutletButton: UIButton!
    @IBOutlet weak var hideWeakIBOutletButton: UIButton!
    
    @IBOutlet weak var addStrongIBOutletButton: UIButton!
    @IBOutlet weak var removeStrongIBOutletButton: UIButton!
    @IBOutlet weak var changeStrongIBOutletButton: UIButton!
    @IBOutlet weak var hideStrongIBOutletButton: UIButton!
    
    @IBOutlet weak var addWeakPropertyButton: UIButton!
    @IBOutlet weak var removeWeakPropertyButton: UIButton!
    @IBOutlet weak var changeWeakPropertyButton: UIButton!
    @IBOutlet weak var hideWeakPropertyButton: UIButton!
    
    @IBOutlet weak var addStrongPropertyButton: UIButton!
    @IBOutlet weak var removeStrongPropertyButton: UIButton!
    @IBOutlet weak var changeStrongPropertyButton: UIButton!
    @IBOutlet weak var hideStrongPropertyButton: UIButton!
    
    // MARK: - Properties
    private weak var weakPropertyLabel: UILabel!
    private var strongPropertyLabel: UILabel!
    private var weakFrame: CGRect = CGRect.infinite
    private var strongFrame: CGRect = CGRect.infinite
    private var weakPropFrame: CGRect = CGRect.infinite
    private var strongPropFrame: CGRect = CGRect.infinite
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weakPropertyLabel = self.weakIBOutletPropertyLabel
        self.strongPropertyLabel = self.weakIBOutletStrongPropertyLabel
        
        self.weakFrame = self.weakIBOutletLabel.frame
        self.strongFrame = self.strongIBOutletLabel.frame
        self.weakPropFrame = self.weakIBOutletPropertyLabel.frame
        self.strongPropFrame = self.weakIBOutletStrongPropertyLabel.frame
    }
    
    /*
    All crashes are expected are ment as learning examples.
    */
    
    // MARK: - Weak IBOutlet
    @IBAction func weakIBOutletButtons(_ sender: Any) {
        
        if let button: UIButton = sender as? UIButton {
            switch button.tag {
            case WeakStrongButtons.add.rawValue:
                 /*
                 
                 App will crash here because the IBOutlet has been set to nil
                 by ARC when it was removed from the view heirarchy
                 
                 */
                self.addWeakIBOutletButton.isEnabled = false
                self.removeWeakIBOutletButton.isEnabled = true
                self.view.addSubview(self.weakIBOutletLabel)
                self.weakIBOutletLabel.frame = self.weakFrame
                self.view.layoutIfNeeded()
            case WeakStrongButtons.remove.rawValue:
                /*
                
                If you remove a weak IBOutlet from the view heirarchy
                ARC releases the memory and sets it to nil
                
                */
                self.addWeakIBOutletButton.isEnabled = true
                self.removeWeakIBOutletButton.isEnabled = false
                self.weakIBOutletLabel.removeFromSuperview()
                self.view.layoutIfNeeded()
            case WeakStrongButtons.change.rawValue:
                /*
                 
                You can only change the IBOutlet's properties if it is
                still in the view heirarchy otherwise app will crash.
                 
                */
                self.weakIBOutletLabel.text = ConstantStrings.changed
            case WeakStrongButtons.hide.rawValue:
                /*
                 
                Show and Hide don't remove object from the view heirarchy,
                so can be changed but app will crash if label is no longer in
                view heirarchy.
                 
                */
                if self.hideWeakIBOutletButton.titleLabel?.text == ConstantStrings.hide {
                    self.hideWeakIBOutletButton.setTitle(ConstantStrings.show, for: .normal)
                    self.weakIBOutletLabel.isHidden = true
                } else {
                    self.hideWeakIBOutletButton.setTitle(ConstantStrings.hide, for: .normal)
                    self.weakIBOutletLabel.isHidden = false
                }
            default:
                break
            }
        }
    }
    
    // MARK: - Strong IBOutlet
    @IBAction func strongIBOutletButtons(_ sender: Any) {
        if let button: UIButton = sender as? UIButton {
            switch button.tag {
            case WeakStrongButtons.add.rawValue:
                self.addStrongIBOutletButton.isEnabled = false
                self.removeStrongIBOutletButton.isEnabled = true
                self.view.addSubview(self.strongIBOutletLabel)
                self.strongIBOutletLabel.frame = self.strongFrame
                self.view.layoutIfNeeded()
            case WeakStrongButtons.remove.rawValue:
                /*
                 
                Add and remove as much as you want, ARC will
                never release the memory.
                 
                */
                self.addStrongIBOutletButton.isEnabled = true
                self.removeStrongIBOutletButton.isEnabled = false
                self.strongIBOutletLabel.removeFromSuperview()
                self.view.layoutIfNeeded()
            case WeakStrongButtons.change.rawValue:
                /*
                 
                 Even if it is not in the view heirarchy its properties
                 can be changed.
                 
                */
                self.strongIBOutletLabel.text = ConstantStrings.changed
            case WeakStrongButtons.hide.rawValue:
                /*
                 
                Show and Hide don't remove objects from the view heirarchy,
                and this is a strong IBOutlet so it can be changed regardless if
                it is in the view heirarchy or not.
                 
                */
                if self.hideStrongIBOutletButton.titleLabel?.text == ConstantStrings.hide {
                    self.hideStrongIBOutletButton.setTitle(ConstantStrings.show, for: .normal)
                    self.strongIBOutletLabel.isHidden = true
                } else {
                    self.hideStrongIBOutletButton.setTitle(ConstantStrings.hide, for: .normal)
                    self.strongIBOutletLabel.isHidden = false
                }
            default:
                break
            }
        }
    }
    
    // MARK: - Weak IBOutlet with Weak Property
    @IBAction func weakIBOutletPropertyButtons(_ sender: Any) {
        if let button: UIButton = sender as? UIButton {
            switch button.tag {
            case WeakStrongButtons.add.rawValue:
                /*
                 
                App will crash here because the IBOutlet and Property are both weak
                and once removed from the view heirarchy they both are set to nil
                 
                */
                self.addWeakPropertyButton.isEnabled = false
                self.removeWeakPropertyButton.isEnabled = true
                self.view.addSubview(self.weakPropertyLabel)
                self.weakPropertyLabel.frame = self.weakPropFrame
                self.view.layoutIfNeeded()
            case WeakStrongButtons.remove.rawValue:
                /*
                 
                If you remove a weak IBOutlet from the view heirarchy
                ARC releases the memory and sets it to nil
                 
                */
                self.addWeakPropertyButton.isEnabled = true
                self.removeWeakPropertyButton.isEnabled = false
                self.weakPropertyLabel.removeFromSuperview()
                self.view.layoutIfNeeded()
            case WeakStrongButtons.change.rawValue:
                /*
                 
                You can only change the IBOutlet's properties if it is
                still in the view heirarchy otherwise app will crash.
                 
                */
                self.weakPropertyLabel.text = ConstantStrings.changed
            case WeakStrongButtons.hide.rawValue:
                /*
                 
                Show and Hide don't remove objects from the view heirarchy,
                so can be changed but app will crash if label is no longer in
                view heirarchy.
                 
                */
                if self.hideWeakPropertyButton.titleLabel?.text == ConstantStrings.hide {
                    self.hideWeakPropertyButton.setTitle(ConstantStrings.show, for: .normal)
                    self.weakPropertyLabel.isHidden = true
                } else {
                    self.hideWeakPropertyButton.setTitle(ConstantStrings.hide, for: .normal)
                    self.weakPropertyLabel.isHidden = false
                }
            default:
                break
            }
        }
    }
    
    // MARK: - Weak IBOutlet with Strong Property
    @IBAction func strongIBOutletPropertyButtons(_ sender: Any) {
        if let button: UIButton = sender as? UIButton {
            switch button.tag {
            case WeakStrongButtons.add.rawValue:
                /*
 
                Either strongPropertyLabel or weakIBOutletStrongPropertyLabel can be used
 
                */
                self.addStrongPropertyButton.isEnabled = false
                self.removeStrongPropertyButton.isEnabled = true
                self.view.addSubview(self.strongPropertyLabel)
                self.strongPropertyLabel.frame = self.strongPropFrame
                self.view.layoutIfNeeded()
            case WeakStrongButtons.remove.rawValue:
                /*
                 
                Add and remove as much as you want, ARC will
                never release the memory.
                 
                */
                self.addStrongPropertyButton.isEnabled = true
                self.removeStrongPropertyButton.isEnabled = false
                self.strongPropertyLabel.removeFromSuperview()
                self.view.layoutIfNeeded()
            case WeakStrongButtons.change.rawValue:
                /*
                 
                You can only change the IBOutlet's properties if it is
                still in the view heirarchy otherwise app will crash.
                 
                */
                self.strongPropertyLabel.text = ConstantStrings.changed
            case WeakStrongButtons.hide.rawValue:
                /*
                 
                Show and Hide don't remove objects from the view heirarchy,
                and this is a weak IBOutlet with a Strong Property so it can
                be changed regardless if it is in the view heirarchy or not.
                 
                */
                if self.hideStrongPropertyButton.titleLabel?.text == ConstantStrings.hide {
                    self.hideStrongPropertyButton.setTitle(ConstantStrings.show, for: .normal)
                    self.strongPropertyLabel.isHidden = true
                } else {
                    self.hideStrongPropertyButton.setTitle(ConstantStrings.hide, for: .normal)
                    self.strongPropertyLabel.isHidden = false
                }
            default:
                break
            }
        }
    }
}

// MARK: - Private Types
extension ViewController {
    private enum WeakStrongButtons: Int {
        case add = 0
        case remove = 1
        case change = 2
        case hide = 3
    }
    
    private struct ConstantStrings {
        static let show = "Show"
        static let hide = "Hide"
        static let changed = "Changed"
    }
}
