//
//  ContainerMainView.swift
//  above-average
//
//  Created by Kyra Drake on 1/16/16.
//  Copyright © 2016 Kyra Drake. All rights reserved.
//

//import Cocoa
/*
class ContainerMainView: UIViewController,SideMenuDelegate {
    
    //variables definition
    var centerNavigationController: UINavigationController!
    var centerViewController: MainView!
    
    var side_menu_state: SideMenuState = .Closed
        {
        didSet{
            let ShowShadow = side_menu_state != .Closed
            showShadowForCenterViewController(ShowShadow)
        }
    }
    
    var side_menu_controller: SideMenuController?
    
    let sidemenu_width: CGFloat = 150 //define here the side menu width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let main_storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        centerViewController = main_storyboard.instantiateViewControllerWithIdentifier("MainView") as? MainView
        
        
        sidemenudelegate = self
        
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMoveToParentViewController(self)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    }

    func togglePanel() {
        let notAlreadyExpanded = (side_menu_state != .Opened)
        if notAlreadyExpanded{
            addPanelViewController()
        }
        animateRightPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func collapseSidePanels() {
        switch (side_menu_state){
        case .Opened:
            togglePanel()
        default:
            break
        }
    }
    
    func addPanelViewController() {
        if(side_menu_controller == nil){
            let main_storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            
            side_menu_controller = main_storyboard.instantiateViewControllerWithIdentifier("SideMenu") as? SideMenuController
            
            addChildSidePanelController(side_menu_controller!)
        }
    }
    func addChildSidePanelController(menu: SideMenuController) {
        view.insertSubview(menu.view, atIndex: 0)
        addChildViewController(menu)
        menu.didMoveToParentViewController(self)
    }
    
    func animateRightPanel(shouldExpand shouldExpand: Bool) {
        if (shouldExpand) {
            side_menu_state = .Opened
            animateCenterPanelXPosition(targetPosition: -sidemenu_width)
            
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
                self.side_menu_state = .Closed
                
                self.side_menu_controller!.view.removeFromSuperview()
                self.side_menu_controller = nil;
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNavigationController.view.layer.shadowOpacity = 0.8
            centerNavigationController.view.layer.shadowRadius = 20
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
    
    func open_side_menu()
    {
        togglePanel()
    }

    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state){
        case .Began:
            if(side_menu_state == .Closed){
                if(gestureIsDraggingFromLeftToRight == false){
                    addPanelViewController()
                }
                showShadowForCenterViewController(true)
            }
            
        case .Changed:
            let screen_center = recognizer.view!.frame.width/2
            let new_center = recognizer.view!.center.x+recognizer.translationInView(view).x
            if(screen_center >= new_center)
            {
                recognizer.view!.center.x = new_center
                recognizer.setTranslation(CGPointZero, inView: view)
            }
            
            
        case .Ended:
            if(side_menu_controller != nil)
            {
                let rec_center = recognizer.view!.center.x
                let screen_center = recognizer.view!.frame.width/2
                if(abs(screen_center-rec_center) > 20)
                {
                    
                    let direction = ( (recognizer.velocityInView(view).x < 10))
                    animateRightPanel(shouldExpand: direction)
                    
                }
                else
                {
                    let open = abs(screen_center - rec_center) > 40
                    animateRightPanel(shouldExpand: open)
                }
                
            }
            
        default:
            break
    }
}*/