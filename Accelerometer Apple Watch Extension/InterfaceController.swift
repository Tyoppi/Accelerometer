//
//  InterfaceController.swift
//  Accelerometer Apple Watch Extension
//
//  Created by 髙田　佳孝 on 2020/12/10.
//  Copyright © 2020 yoppi. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class InterfaceController: WKInterfaceController {
    
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var accelerometerX: WKInterfaceLabel!
    @IBOutlet weak var accelerometerY: WKInterfaceLabel!
    @IBOutlet weak var accelerometerZ: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        if motionManager.isAccelerometerAvailable{
            //インターバルの設定[sec]
            motionManager.accelerometerUpdateInterval = 0.2
            //センサー値の取得開始
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!, withHandler:{(accelData:CMAccelerometerData?, error0C: Error?)in self.outputAccelData(acceleration:accelData!.acceleration)})
        }
        
        
    }
    
    func outputAccelData(acceleration: CMAcceleration){
        //加速度センサー[G]
        accelerometerX.setText(String(format: "%06f", accelerometerX))
        accelerometerY.setText(String(format: "%06f", acceleration.y))
        accelerometerZ.setText(String(format: "%06f", acceleration.z))
    }
    //センサー取得を止める場合
    func stopAccelerometer(){
        if(motionManager.isAccelerometerActive){
            motionManager.stopAccelerometerUpdates()
        }
        
    }
     
}
