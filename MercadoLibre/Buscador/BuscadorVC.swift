//
//  ViewController.swift
//  MercadoLibre
//
//  Created by Maria Fernanda Paz Rodriguez on 3/06/23.
//

import UIKit

class BuscadorVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var BuscadorZone: UIView!
    var typingTimer: Timer?
    
    var emptyView:EmptyViewManager!
    var ViewModel:BuscadorViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyView = EmptyViewManager()
        ViewModel = BuscadorViewModel()
        SetupUI()
        
    }
    
    func SetupUI(){
        
        emptyView.showEmptyView(Vista: BuscadorZone)
        emptyView.emptyView.SetupView(Animation: "RealizarBusqueda",Title:"Realiza una busqueda")
        
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                if typingTimer != nil{
                    
                    typingTimer?.invalidate()
                    
                }
                
                typingTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(EndSearch), userInfo: nil, repeats: false)
                
            }
            
        }
    
    @objc func EndSearch() {
        
        getBusqueda(Busqueda:Buscador.text!)
    }
    
    func getBusqueda(Busqueda:String){
        
        ViewModel.Busqueda(Busqueda: Busqueda) { Result in
            
            print(Result)
        }
        
    }
    
}

