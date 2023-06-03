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
    
    var emptyView:EmptyViewManager!
    var ViewModel:BuscadorViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyView = EmptyViewManager()
        ViewModel = BuscadorViewModel()
        Buscador.delegate = self
        
    }
    
    func SetupUI(){
        
        emptyView.showEmptyView(Vista: BuscadorZone)
        emptyView.emptyView.SetupView(Animation: "RealizarBusqueda",Title:"Realiza una busqueda")
        
    }
    
}

