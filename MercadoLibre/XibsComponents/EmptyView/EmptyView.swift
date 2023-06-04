//
//  EmptyView.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation
import UIKit
import Lottie

//Empty View Component: obtiene todos los elementos del Xib incluidas funcionalidades del mismo
class EmptyView:UIView{
    
    @IBOutlet weak var Animation: LottieAnimationView!
    @IBOutlet weak var Titles: UILabel!
    
    //Configuracion para mostrar lottie deseado y mostrar el titulo que tendra la vista
    func SetupView(Animation:String,Title:String){
        
        let animation = LottieAnimation.named(Animation,subdirectory: "Animations")
        self.Animation.animation = animation
        self.Animation.contentMode = .scaleAspectFit
        self.Animation.loopMode = .playOnce
        self.Animation.animationSpeed = 1.0
        self.Animation.play()
        Titles.text = Title
        
    }
    
}

//Empty View Manager: se encarga de Presentar o Remover la vista EmptyState de la vista de donde se necesite el componente
class EmptyViewManager: NSObject {
    
    var emptyView = EmptyView()

    func showEmptyView( Vista : UIView) {
        
        if !emptyView.isDescendant(of: Vista){
            
            emptyView = (Bundle.main.loadNibNamed("EmptystateView", owner: Vista)?.first as? EmptyView)!
            emptyView.frame = CGRect(x: Vista.center.x - (Vista.frame.width/2), y: Vista.center.y - (Vista.frame.height/2), width: Vista.frame.width, height: Vista.frame.height / 2)
            Vista.addSubview(emptyView)
            
        }
        
    }
    
    func hideEmptyView() {
        
        emptyView.isHidden = true
        emptyView.removeFromSuperview()
        
    }
    
}
