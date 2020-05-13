//
//  MateriasViewController.swift
//  StudyGarden
//
//  Created by user168001 on 5/12/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class MateriasViewController: UITableViewController, UISearchResultsUpdating {

    @IBOutlet weak var MateriasTableView: UITableView!
    
    let direccion="http://www.martinmolina.com.mx/202011/StudyGarden/Materias.json"
    
    var nuevoArray:[Any]?
    var datosFiltrados = [Any]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        
        // si la caja de búsuqeda es vacía, entonces mostrar todos los resultados
        if searchController.searchBar.text! == "" {
            datosFiltrados = nuevoArray!
        } else {
            // Filtrar los resultados de acuerdo al texto escrito en la caja que es obtenido a través del parámetro $0
            datosFiltrados = nuevoArray!.filter{
                let objetoMarca=$0 as! [String:Any]
                let s:String = objetoMarca["Materia"] as! String;
                return(s.lowercased().contains(searchController.searchBar.text!.lowercased())) }
        }
        
        self.tableView.reloadData()
    }
    
    
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                
                print("error")
                //handle errors here
                
            }
        }
        return [AnyObject]()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: direccion)
        /*if let url = URL(string: direccion){
            URLSession.shared.dataTask(with: url){ (datos:Data?, reponse:URLResponse?, error:Error?) in
                if error == nil{
                    print("Everything fine")
                    if datos != nil{
                        print("I got data")
                        if let json = try? JSONSerialization.jsonObject(with: datos!, options: []) as? [Any?]{
                            print(json)
                        }
                    }
                }else{
                    print("We have an error")
                }
                }.resume()
        }*/
        
        let datos = try? Data(contentsOf: url!)
        nuevoArray = try! JSONSerialization.jsonObject(with: datos!) as? [Any]
        datosFiltrados = nuevoArray!
    
        searchController.searchResultsUpdater = self

        searchController.obscuresBackgroundDuringPresentation = false
       
        searchController.hidesNavigationBarDuringPresentation = false
        
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //paso 11 remplazar el uso de nuevoArray por datosFiltrados
        return (datosFiltrados.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntradaMateria", for: indexPath)

        //paso 12 remplazar el uso de nuevoArray por datosFitrados
        //Usar el objeto marca para la obtencion de los datos
        let objetoMarca = datosFiltrados[indexPath.row] as! [String: Any]
        let s:String = objetoMarca["Materia"] as! String
        
        cell.textLabel?.text=s
        
        return cell
    }


}
