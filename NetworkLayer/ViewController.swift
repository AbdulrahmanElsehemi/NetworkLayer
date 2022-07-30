//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Dev3 on 03/06/2022.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    //Dispose bag
    private let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ApiClient.getPosts(userId: 1)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { postsList in
                print("List of posts:", postsList)
            }, onError: { error in
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
            })
            .disposed(by: disposeBag)
    }


}

