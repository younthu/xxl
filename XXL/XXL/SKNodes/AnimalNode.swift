//
//  AnimalNode.swift
//  XXL
//
//  Created by Zhiyong Yang on 7/26/16.
//  Copyright © 2016 Andrew Yang. All rights reserved.
//

import SpriteKit

class AnimalNode: SKSpriteNode {
    var _selected: Bool = false;
    var rowIndex: Int = 0;
    var colIndex: Int = 0;
    
    var selected: Bool{
        get {
            return _selected;
        }
        
        set {
            _selected = newValue;
        }
    }
    
}
