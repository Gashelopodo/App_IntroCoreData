//
//  ViewController.swift
//  App_IntroCoreData
//
//  Created by cice on 7/4/17.
//  Copyright © 2017 gashe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: - Variables locales
    var manageContext : NSManagedObjectContext!
    
    
    //MARK: - outlet
    
    @IBOutlet weak var myName: UITextField!
    @IBOutlet weak var myLastName: UITextField!
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var myPhone: UITextField!
    @IBOutlet weak var myAddress: UITextField!
    @IBOutlet weak var myText: UITextView!
    @IBOutlet weak var mySearch: UITextField!
    
    
    //MARK: - action
    
    @IBAction func loadACTION(_ sender: Any) {
        
        let search = mySearch.text!
        var text = ""
        
        
        
        let customRequest : NSFetchRequest<Persona> = Persona.fetchRequest()
        let customPredicate = NSPredicate(format: "nombre = '\(search)'")
        let customSortDescriptor = NSSortDescriptor(key: "nombre", ascending: true)
        customRequest.predicate = customPredicate
        customRequest.sortDescriptors = [customSortDescriptor]
        
        //4 -> Recuperamos
        
        do {
            let multitud = try manageContext.fetch(customRequest)
            for c_persona in multitud{
                print(c_persona.nombreApellido())
                text += c_persona.nombreApellido() + "\n"
            }
            myText.text = text
        } catch {
            print("Error salvando datos")
        }

        
        
    }
    
    @IBAction func saveACTION(_ sender: Any) {
        
        
        
        if(myName.text != "" && myLastName.text != "" && myAddress.text != "" && myPhone.text != "" && myEmail.text != ""){
            
            
            let customPersona = Persona(context: manageContext)
            customPersona.nombre = myName.text
            customPersona.apellido = myLastName.text
            customPersona.email = myEmail.text
            
            if let movil = Int64(myPhone.text!){
                customPersona.movil = movil
            }
            
            customPersona.direccion = myAddress.text
        
            do {
                try manageContext.save()
            } catch let error{
                print("Error salvando datos \(error.localizedDescription)")
            }
            
            
            
        }else{
        
        }

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

