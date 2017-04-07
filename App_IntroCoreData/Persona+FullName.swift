//
//  Persona+FullName.swift
//  App_IntroCoreData
//
//  Created by cice on 7/4/17.
//  Copyright © 2017 gashe. All rights reserved.
//

import Foundation
import CoreData

extension Persona{
    
    func nombreApellido() -> String{
        return "\(self.nombre!) \(self.apellido!) \(self.email!)"
    }
    
}

