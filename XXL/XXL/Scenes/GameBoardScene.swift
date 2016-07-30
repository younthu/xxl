//
//  GameBoardScene.swift
//  XXL
//
//  Created by Zhiyong Yang on 7/26/16.
//  Copyright © 2016 Andrew Yang. All rights reserved.
//

import SpriteKit

class GameBoardScene: SKScene {
    
    var board: GameBoard = GameBoard();
    var cellWidth: CGFloat = 0;
    var cellHeight: CGFloat = 0;
    var paddingLeft: CGFloat = 10;
    var paddingTop: CGFloat = 10;

    override func didMoveToView(view: SKView) {
        
        board.numberOfCols = 3;
        board.numberOfRows = 3;
        self.cellWidth = (view.frame.size.width - paddingLeft * 2) / CGFloat(board.numberOfCols);
        self.cellHeight = (view.frame.size.width - paddingTop * 2) / CGFloat(board.numberOfRows);
        // draw cell background
        self.drawCellBackground();
        
        // draw animals
        self.drawAnimals();
    }
    
    func drawCellBackground() {
        for row in 0..<board.numberOfRows {
            for col in 0..<board.numberOfCols{
                // add cell node here
                let myLabel = SKSpriteNode(imageNamed:"cellBackground");//fontNamed:"Chalkduster")
                myLabel.size = CGSizeMake(cellWidth, cellHeight);
                
                let x = paddingLeft + CGFloat(col ) * cellWidth + CGRectGetMidX(self.frame) - self.view!.frame.size.width / 2 + cellWidth/2.0 ;
                let y = paddingTop + CGFloat(row) * cellHeight + self.view!.frame.size.width / 2;
                
                myLabel.position = CGPoint(x:x , y: y);
                
                self.addChild(myLabel)
            }
        }
    }
    
    func drawAnimals() {
        for row in 0..<board.numberOfRows {
            for col in 0..<board.numberOfCols{
                // add cell node here
                let myLabel = SKSpriteNode(imageNamed:"Spaceship");//fontNamed:"Chalkduster")
                myLabel.size = CGSizeMake(cellWidth / 2 , cellHeight / 2 );
                
                
                let x = paddingLeft + CGFloat(col ) * cellWidth + CGRectGetMidX(self.frame) - self.view!.frame.size.width / 2 + cellWidth/2.0 ;
                let y = paddingTop + CGFloat(row) * cellHeight + self.view!.frame.size.width / 2;
                myLabel.position = CGPoint(x: x , y: y);
                
                self.addChild(myLabel)
            }
        }
    }
}
