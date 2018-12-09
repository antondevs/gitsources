//
//  ApplicationAssembly.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
    
    class var assembler: Assembler {
        return Assembler([
            RepositoryListAssemblyContainer(),
            BrowserDirAssemblyContainer(),
            WebPageAssemblyContainer()
        ])
    }
    
    var assembler: Assembler
    
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
}

extension SwinjectStoryboard {
    
    @objc public static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
        
        defaultContainer.register(ApiProtocol.self) { _ in ApiService() }
            .inObjectScope(.container)
    }
    
}

