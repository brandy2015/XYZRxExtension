//
//  XYZInt.swift
//  XYZRxExtension
//
//  Created by zhangzihao on 2022/4/22.
//

import UIKit

class XYZInt: NSObject {

}
//将数字导出拼读数
//one hundred twenty-three
//four
//fifty-six

//example(of: "map") {
//  let disposeBag = DisposeBag()
//
//  // 1
//  let formatter = NumberFormatter()
//  formatter.numberStyle = .spellOut
//
//  // 2
//  Observable<Int>.of(123, 4, 56)
//    // 3
//    .map {
//      formatter.string(for: $0) ?? ""
//    }
//    .subscribe(onNext: {
//      print($0)
//    })
//    .disposed(by: disposeBag)
//}




//enumerated
//example(of: "enumerated and map") {
//  let disposeBag = DisposeBag()
//
//  // 1
//  Observable.of(1, 2, 3, 4, 5, 6)
//    // 2
//    .enumerated()
//    // 3
//    .map { index, integer in
//      index > 2 ? integer * 2 : integer
//    }
//    // 4
//    .subscribe(onNext: {
//      print($0)
//    })
//    .disposed(by: disposeBag)
//}
