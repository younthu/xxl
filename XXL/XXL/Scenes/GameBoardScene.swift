//
//  GameBoardScene.swift
//  XXL
//
//  Created by Zhiyong Yang on 7/26/16.
//  Copyright © 2016 Andrew Yang. All rights reserved.
//

import SpriteKit

class GameBoardScene: SKScene {
    var selectedNode:AnimalNode?;
    var board: GameBoard = GameBoard();
    var cellWidth: CGFloat = 0;
    var cellHeight: CGFloat = 0;
    var paddingLeft: CGFloat = 10;
    var paddingTop: CGFloat = 10;
    var animals: Array<AnimalNode> = Array<AnimalNode>();

    override func didMoveToView(view: SKView) {
        
        board.numberOfCols = 3;
        board.numberOfRows = 3;
        self.cellWidth = (view.frame.size.width - paddingLeft * 2) / CGFloat(board.numberOfCols);
        self.cellHeight = self.cellWidth;
        // draw cell background
        self.drawCellBackground();
        
        // draw animals
        self.drawAnimals();
        
        let pan :UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(GameBoardScene.handlePan(_:)));
        self.view?.addGestureRecognizer(pan);
    }
    
    func drawCellBackground() {
        for row in 0..<board.numberOfRows {
            for col in 0..<board.numberOfCols{
                // add cell node here
                let myLabel = SKSpriteNode(imageNamed:"cellBackground");//fontNamed:"Chalkduster")
                myLabel.size = CGSizeMake(cellWidth, cellHeight);
                
                let p = positionForCell(Int(row), col: Int(col));
                
                myLabel.position = p;
                
                self.addChild(myLabel)
            }
        }
    }
    
    func selectNode(gesture:UIPanGestureRecognizer) {
        selectedNode = nil;
        let position  = gesture.locationInView(self.view);
        let col:Int = Int(floor((position.x - paddingLeft)/cellWidth));
        let row:Int = Int(floor((self.view!.frame.size.height - position.y )/cellHeight)) - 1;
        NSLog("1.Selecting node(%d, %d) at point(%f, %f)", col, row, position.x, position.y);
        
        for animal:AnimalNode in animals {
            if animal.rowIndex == row && animal.colIndex == col {
                NSLog("2.Selected node(%d, %d) at point(%f, %f)", col, row, position.x, position.y);
                selectedNode = animal;
                break;
            }
        }
        
        
        NSLog("3.Finished selecting node at point(%f, %f)", position.x, position.y);
    }
    
    func positionForCell(row:Int, col: Int) -> CGPoint{
        let x = paddingLeft + CGFloat(col ) * cellWidth + CGRectGetMidX(self.frame) - self.view!.frame.size.width / 2 + cellWidth/2.0 ;
        let y = paddingTop + CGFloat(row) * cellHeight + self.view!.frame.size.width / 2;
        
        return CGPoint(x: x, y: y);
    }
    
    func handlePan(gesture:UIPanGestureRecognizer) {
        if gesture.state == .Began {
            selectNode(gesture);
        }else if gesture.state == .Changed {
            if selectedNode == nil {
                return;
            }
            let trans = gesture.translationInView(self.view);
            let position = positionForCell((selectedNode?.rowIndex)!, col: (selectedNode?.colIndex)!);
            let action = SKAction.moveTo(CGPointMake(position.x + trans.x, position.y - trans.y), duration: 0.5);
            
            
            self.selectedNode?.runAction(action);
        }else if gesture.state == .Ended {
            // trigger swap here
            if selectedNode == nil {
                return;
            }
            let position = positionForCell((selectedNode?.rowIndex)!, col: (selectedNode?.colIndex)!);
            let action = SKAction.moveTo(position, duration: 0.5);
            self.selectedNode?.runAction(action);
        }
    }
    
    func markNodeWithLabel(node:AnimalNode, label:String){
        let labelNode = SKLabelNode();
        labelNode.text = label;
        labelNode.position = CGPointZero;
        
        
        node.addChild(labelNode);
    }
    func drawAnimals() {
        for row in 0..<board.numberOfRows {
            for col in 0..<board.numberOfCols{
                // add cell node here
                let animal = AnimalNode(imageNamed:"Spaceship");//fontNamed:"Chalkduster")
                animal.size = CGSizeMake(cellWidth / 2 , cellHeight / 2 );
                
                
                let p = positionForCell(Int(row), col: Int(col));
                animal.position = p;
                animal.rowIndex = Int(row);
                animal.colIndex = Int(col);
                
                markNodeWithLabel(animal, label: String(format: "%d, %d", row, col));
                self.addChild(animal)
                
                animals.append(animal);
                
            }
        }
    }
}
