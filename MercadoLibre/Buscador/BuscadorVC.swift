//
//  ViewController.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import UIKit
import SDWebImage

class BuscadorVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var BuscadorZone: UIView!
    
    var Infomation:[BuscadorModel.Results] = []
    var ViewModel:BuscadorViewModel!
    var emptyView:EmptyViewManager!
    var readylooksometing = false
    var typingTimer: Timer?
    var ProductId:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyView = EmptyViewManager()
        ViewModel = BuscadorViewModel()
        SetupUI()
        
    }
    
    //Transforma Cambia el frame en caso de que el user rote el dispositivo
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
        
        let Vista = self.view!
        
            if UIDevice.current.orientation.isLandscape {
                
                if (wasportrait == true){
                    wasportrait = false
                    
                    emptyView.emptyView.frame = CGRect(x: Vista.center.x - 50, y: Vista.center.y - ((Vista.frame.height + 110 ) / 2), width: Vista.frame.width, height: Vista.frame.height/2 )
                    
                }
                
            } else {
                
                emptyView.emptyView.frame = CGRect(x: Vista.center.x - (Vista.frame.width/2), y: Vista.center.y - (Vista.frame.height/2), width: Vista.frame.height, height: Vista.frame.width / 2)
            }
        }
    
    //Configuraciones iniciales de la vista
    func SetupUI(){
        
            wasportrait = true
            
        
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.register(UINib(nibName: "ProductsCell", bundle: nil), forCellReuseIdentifier: "ProductsCell")
        
    }
    
     //Se encarga de ver cuando el usuario termino de escribir
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                if typingTimer != nil{
                    
                    typingTimer?.invalidate()
                    
                }
                
                typingTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(StartSearch), userInfo: nil, repeats: false)
                
            }
            
        }
    
    //Inicia la busqueda De los productos
    @objc func StartSearch() {
        
        if (Buscador.text! == ""){
            return
        }
        
        emptyView.showEmptyView(Vista: BuscadorZone)
        emptyView.emptyView.SetupView(Animation: "Loading",Title:"Cargando...")
        TableView.isHidden = true
        
        self.view.endEditing(true)
        ViewModel.Busqueda(Busqueda: Buscador.text!) { Result in
            self.TableView.isHidden = false
            self.readylooksometing = true
            if (Result?.results != nil){
                if (self.Infomation.count != 0){
                    self.TableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: false)
                }
                self.Infomation = Result!.results!
                self.TableView.reloadData()
                
            }else{
                
                self.Infomation = []
                self.TableView.reloadData()
                
            }
            
        }
        
    }
    
     //Coparte informacion por medio del uso del segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let destinationVC = segue.destination as! ProductDetail
            destinationVC.ItemID = ProductId
            }
        }
    
}

//Manejo de la TableView Perteneciente a la vista
extension BuscadorVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ProductId = Infomation[indexPath.row].id
        self.performSegue(withIdentifier: "showDetails", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
        cell.logoImage.sd_setImage(with: URL(string: Infomation[index].thumbnail!))
        cell.Price.text = Utils().Currency(Number: Infomation[index].price!)
        cell.ProducName.text = Infomation[index].title ?? ""
        cell.selectionStyle = .none
       return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var Animation = ""
        var Title = ""
        
        if (Infomation.count == 0){
            
            if readylooksometing == false{
                
                Animation = "RealizarBusqueda"
                Title = "Realiza una búsqueda"
                
            }else{
                
                if UIDevice.current.orientation.isLandscape {
                    wasportrait = false
                } else {
                    wasportrait = true
                }
                Animation = "Noting"
                Title = "No se encontraron resultados"
                
            }
            
            emptyView.showEmptyView(Vista: BuscadorZone)
            emptyView.emptyView.SetupView(Animation: Animation,Title:Title)
            
        }else{
            
            emptyView.hideEmptyView()
            
        }
        
        return Infomation.count
    }
    
}

