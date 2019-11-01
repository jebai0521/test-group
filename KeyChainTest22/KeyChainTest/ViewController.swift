//
//  ViewController.swift
//  KeyChainTest
//
//  Created by Ming Chen on 24/10/19.
//  Copyright © 2019 Ming Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let account = "badgeNumber";
        
        let service = "me.perkd";
        
        // 存储数据
//        let saveBool = KeyChainManager.keyChainSaveData(data: "我期待的女孩111" as Any, withAccount: account, withService: service)
//        if saveBool {
//            print("存储成功")
//        }else{
//            print("存储失败")
//        }
        // 获取数据
        let getString = KeyChainManager.keyChainReadData(account: account, withService: service ) as? String
        print(getString)
        print(Int(getString ?? "0") ?? 0)
        let badge = (Int(getString ?? "0") ?? 0) + 11 as NSNumber
        print(badge)
//
//
//        // 更新数据
//        let updataBool = KeyChainManager.keyChainUpdata(data: "眼睛像云朵", withIdentifier: KeyChain)
//        if updataBool {
//            print("更新成功")
//        }else{
//            print("更新失败")
//        }
//        // 获取更新后的数据
//        let getUpdataString = KeyChainManager.keyChainReadData(identifier: KeyChain) as! String
//        print(getUpdataString)
//
//
//        // 删除数据
//        KeyChainManager.keyChianDelete(identifier: KeyChain)
//        // 获取删除后的数据
//        let getDeleteString = KeyChainManager.keyChainReadData(identifier: KeyChain)
//        print(getDeleteString)
    }


}

