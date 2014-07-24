//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex on 23/07/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

import UIKit
import Darwin
class ViewController: UIViewController {
                            
    @IBOutlet var ticTagImg1: UIImageView!
    @IBOutlet var ticTagImg2: UIImageView!
    @IBOutlet var ticTagImg3: UIImageView!
    @IBOutlet var ticTagImg4: UIImageView!
    @IBOutlet var ticTagImg5: UIImageView!
    @IBOutlet var ticTagImg6: UIImageView!
    @IBOutlet var ticTagImg7: UIImageView!
    @IBOutlet var ticTagImg8: UIImageView!
    @IBOutlet var ticTagImg9: UIImageView!
    
    @IBOutlet var playerAtTurnImg: UIImageView!
    
     @IBOutlet var ticTacBtn1: UIButton!
     @IBOutlet var ticTacBtn2: UIButton!
     @IBOutlet var ticTacBtn3: UIButton!
     @IBOutlet var ticTacBtn4: UIButton!
     @IBOutlet var ticTacBtn5: UIButton!
     @IBOutlet var ticTacBtn6: UIButton!
     @IBOutlet var ticTacBtn7: UIButton!
     @IBOutlet var ticTacBtn8: UIButton!
     @IBOutlet var ticTacBtn9: UIButton!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var resetBtn: UIButton!
    
    var plays=Dictionary<Int,Int>()
    var done=false
    var playerAtTurn=1
    var marksSet=0
    @IBAction func UIButtonClicked(sender:UIButton){
    messageLabel.hidden=true
       if !plays[sender.tag]  && !done{
        setImageForSpot(sender.tag,player:playerAtTurn)
        marksSet += 1
        checkForWin()
        if  !done && !tie(){
            togglePlayer()}
        
        }
        
       
    }
    func tie()-> Bool{
        if marksSet>=9{
        done=true
        messageLabel.hidden=false
        messageLabel.text="This looks like a tie"
        resetBtn.hidden=false
        return true
        }
        return false
    }
    func togglePlayer(){
        playerAtTurn = playerAtTurn == 1 ? 0 : 1
        var playerM:String = playerAtTurn==1 ? "x" : "o"
        playerAtTurnImg.image=UIImage(named: playerM)
    }
    @IBAction func rstBtnClicked(){
    done=false
    resetBtn.hidden=true
    messageLabel.hidden=true
        reset()
    }
    
    
    
    func reset(){
        marksSet=0
        plays=[:]
        ticTagImg1.image=nil
        ticTagImg2.image=nil
        ticTagImg3.image=nil
        ticTagImg4.image=nil
        ticTagImg5.image=nil
        ticTagImg6.image=nil
        ticTagImg7.image=nil
        ticTagImg8.image=nil
        ticTagImg9.image=nil
        
    }
   
    func setImageForSpot(spot:Int,player:Int){
        var playerMark:String = player==1 ? "x" : "o"
        plays[spot]=player
        switch spot{
        
        case 1:
            ticTagImg1.image=UIImage(named: playerMark)
        case 2:
            ticTagImg2.image=UIImage(named: playerMark)
        case 3:
            ticTagImg3.image=UIImage(named: playerMark)
        case 4:
            ticTagImg4.image=UIImage(named: playerMark)
        case 5:
            ticTagImg5.image=UIImage(named: playerMark)
        case 6:
            ticTagImg6.image=UIImage(named: playerMark)
        case 7:
            ticTagImg7.image=UIImage(named: playerMark)
        case 8:
            ticTagImg8.image=UIImage(named: playerMark)
        case 9:
            ticTagImg9.image=UIImage(named: playerMark)
        default: println("OMG")
        }
    
    }
    
    func checkForWin(){
        var whoWon=["O":0, "X":1]
        for (key,value) in whoWon{
            if( (plays[7]==value && plays[8]==value && plays[9]==value) ||
                (plays[4]==value && plays[5]==value && plays[6]==value) ||
                (plays[1]==value && plays[2]==value && plays[3]==value) ||
                
                (plays[1]==value && plays[4]==value && plays[7]==value) ||
                (plays[2]==value && plays[5]==value && plays[8]==value) ||
                (plays[3]==value && plays[6]==value && plays[9]==value) ||
                
                (plays[1]==value && plays[5]==value && plays[9]==value) ||
                (plays[3]==value && plays[5]==value && plays[7]==value)){
            messageLabel.hidden=false
            messageLabel.text="looks like \(key) won!"
            resetBtn.hidden=false
            done=true
            }
        
        }
    
    }
    
    

    
     func isOccupied(spot:Int)->Bool{
    return Bool(plays[spot])
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerAtTurnImg.image=UIImage(named: "x")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

