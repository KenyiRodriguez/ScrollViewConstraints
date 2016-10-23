//
//  ViewController.swift
//  ScrollViewConstraints
//
//  Created by Kenyi Rodriguez on 22/10/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    
    
    @IBAction func tapCerrarTeclado(_ sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
    }
    
    
    //MARK: - Notificación telcado
    
    
    func tecladoSeEstaMostrando(notificacion : NSNotification) -> Void{
        
        let tamanoTeclado = (notificacion.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
 
        UIView.animate(withDuration: 0.35, animations: {
            
            self.constraintBottomScroll.constant = (tamanoTeclado?.height)!
            self.view.layoutIfNeeded()
        })
    }
    
    
    func tecladoSeEstaOcultando(notificacion : NSNotification) -> Void {
  
        UIView.animate(withDuration: 0.35, animations: {
            
            self.constraintBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    
    //MARK: - Ciclo de vida
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.tecladoSeEstaMostrando(notificacion:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.tecladoSeEstaOcultando(notificacion:)), name: .UIKeyboardWillHide, object: nil)
        
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
    }
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

