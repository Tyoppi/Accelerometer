//
//  ViewController.swift
//  Accelerometer
//
//  Created by 髙田　佳孝 on 2020/12/05.
//  Copyright © 2020 yoppi. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //MotionManager
    let motionManager = CMMotionManager()
    
    //3 axes
   
    @IBOutlet weak var accelerometerX: UILabel!
    @IBOutlet weak var accelerometerY: UILabel!
    @IBOutlet weak var accelerometerZ: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable{
            //インターバルの設定[sec]
            motionManager.accelerometerUpdateInterval = 0.2
            
            //センサー値の取得開始
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!,
                withHandler: {(accelData:CMAccelerometerData?, error0C: Error?)in
                    self.outputAccelData(acceleration: accelData!.acceleration)
            })
            
        }
        
    }
    func outputAccelData(acceleration: CMAcceleration){
        //加速度センサー[G]
        accelerometerX.text = String(format: "%06f", acceleration.x)
        accelerometerY.text = String(format: "%06f", acceleration.y)
        accelerometerZ.text = String(format: "%06f", acceleration.z)
    }
    
    //センサー取得を止める場合
    func stopAccelerometer(){
        if(motionManager.isAccelerometerActive){
            motionManager.stopAccelerometerUpdates()
        }
    }
    
}
///aaaaa




