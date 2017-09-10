//
//  ViewController.swift
//  Limpieza Agenda
//
//  Created by Eduardo Herrera on 10/16/16.
//  Copyright © 2016 Eduardo Herrera. All rights reserved.
//

import UIKit

import Contacts

class ViewController: UIViewController {

    
    @IBAction func Boton2(_ sender: AnyObject) {
        let contactos = CNContactStore()
        contactos.isAccessibilityElement = true
        
        
        /*
        let nuevoContacto = CNMutableContact()
        nuevoContacto.givenName = "Eduardo Loco"
        let grabar = CNSaveRequest()
        grabar.add(nuevoContacto, toContainerWithIdentifier: nil)
        */
        
        let datos = [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor]
        
        let predicate: NSPredicate = CNContact.predicateForContacts(matchingName: "Eduardo")
        
        let resultado = try! contactos.unifiedContacts(matching: predicate, keysToFetch:datos)
        
        print("Hola")
        
        for contacto in resultado {
            print("\(contacto.givenName)  \(contacto.familyName)")
            let mutable = contacto.mutableCopy() as! CNMutableContact
            
            
            
            mutable.familyName = "Herrera"
            let grabar = CNSaveRequest()
            grabar.update(mutable)
            //grabar.delete(mutable)
            try! contactos.execute(grabar)
        }
        
        
        print("chao")
        
    }

}

