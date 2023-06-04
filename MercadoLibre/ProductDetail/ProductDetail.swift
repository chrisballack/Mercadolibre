//
//  ProductDetail.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation
import UIKit
import SDWebImage

class ProductDetail: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var EmptyViewZone: UIView!
    @IBOutlet weak var Descriptions: UILabel!
    @IBOutlet weak var Amount: UILabel!
    @IBOutlet weak var Titles: UILabel!
    
    var productInfo:ProductsModel.ProductsData!
    var ViewModel:ProductsViewModel!
    var emptyView:EmptyViewManager!
    var ItemID:String!
    var Auxrow: Int8! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel = ProductsViewModel()
        emptyView = EmptyViewManager()
        GetProductInfo()
        setupGestures()
    }
    
    //Transforma Cambia el frame en caso de que el user rote el dispositivo
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
        
        let Vista = self.view!
        
            if UIDevice.current.orientation.isLandscape {
                
                emptyView.emptyView.frame = CGRect(x: Vista.center.x - 50, y: Vista.center.y - ((Vista.frame.height + 110 ) / 2), width: Vista.frame.width, height: Vista.frame.height/2 )
            } else {
                
                emptyView.emptyView.frame = CGRect(x: Vista.center.x - (Vista.frame.width/2), y: Vista.center.y - (Vista.frame.height/2), width: Vista.frame.height, height: Vista.frame.width / 2)
            }
        }
    
    //Accion para volver a la vista anterior con el uso del navigation controller
    @IBAction func GoBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //Agrega los swipe gestures al CollectionView
    func setupGestures(){
        
        CollectionView.register(UINib(nibName: "ImagesCell", bundle: .main), forCellWithReuseIdentifier: "ImagesCell")
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swipeleft.direction = .left
        
        CollectionView.addGestureRecognizer(swipeleft)
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swiperight.direction = .right
        
        CollectionView.addGestureRecognizer(swiperight)
        
    }
    
    //Obtengo la informacion de los productos
    func GetProductInfo(){
        
        emptyView.showEmptyView(Vista: self.EmptyViewZone)
        emptyView.emptyView.SetupView(Animation: "Loading",Title:"Cargando...")
        
        ViewModel.Product(IdItem: ItemID) { Result in
            
            if (Result != nil){
                
                self.emptyView.hideEmptyView()
                self.EmptyViewZone.isHidden = true
                self.ViewModel.Description(IdItem: self.ItemID) { Result in
                    self.Descriptions.text = Result?.plain_text ?? "Sin descripcion"
                }
                self.productInfo = Result
                self.Titles.text = self.productInfo.title!
                self.Amount.text = Utils().Currency(Number: self.productInfo.price!)
                self.CollectionView.reloadData()
                
            }else{
                
                self.EmptyViewZone.isHidden = false
                self.emptyView.showEmptyView(Vista: self.EmptyViewZone)
                self.emptyView.emptyView.SetupView(Animation: "error",Title:"Ocurrio un error")
                
            }
            
        }
        
    }
    
    
    public func IrAlaDerecha() {
        //el auxrow funciona como limitante de las filas
        if Auxrow != 0 {
            
            Auxrow -= 1
            //gracias al scroll to item podemos movernos a la celda especifica
            self.CollectionView.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    
    @objc func Gesture(gesture: UISwipeGestureRecognizer) -> Void{
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right{
            
            IrAlaDerecha()
            
        }else if gesture.direction == UISwipeGestureRecognizer.Direction.left{
            
            if Auxrow != (self.productInfo.pictures!.count - 1) {
                
                Auxrow += 1
                
                self.CollectionView.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
                
            }
            
        }
        
    }
    
    //Compartir el link de mercado libre con otros usuarios
    @objc func ShareInformation(_ sender: UIButton) {
        
        let textToShare = "Ayudame con mis compras en mercado libre"
        
        if let myWebsite = URL(string: self.productInfo.permalink!) {
            
            let objectsToShare = [textToShare, myWebsite] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }
        
    }
    
}

//Manejo del collectionView
extension ProductDetail: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if  self.productInfo == nil{
            
            return 0
            
        }else{
            
            return self.productInfo.pictures!.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCell", for: indexPath) as! ProductDetailCell
        cell.Imagen.sd_setImage(with: URL(string: (self.productInfo.pictures![index].secure_url!)))
        cell.NumberLabel.text = "\(index+1)/\(self.productInfo.pictures!.count)"
        cell.ButtonShared.addTarget(self, action: #selector(self.ShareInformation(_:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        }
    
    
}

