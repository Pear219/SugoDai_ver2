//
//  Koma1ViewController.swift
//  SugoDai
//
//  Created by 加藤 on 2022/02/02.
//

import UIKit

class Koma1ViewController: UIViewController{
    
    @IBOutlet var Koma1: UIImageView!
    @IBOutlet var Koma2: UIImageView!
    @IBOutlet var Koma3: UIImageView!
    @IBOutlet var Koma4: UIImageView!
    @IBOutlet var Koma5: UIImageView!
    @IBOutlet var Koma6: UIImageView!
    @IBOutlet var Koma7: UIImageView!
    @IBOutlet var Koma8: UIImageView!
    @IBOutlet var Koma9: UIImageView!
    @IBOutlet var Koma10: UIImageView!
    @IBOutlet var Koma11: UIImageView!
    @IBOutlet var Koma12: UIImageView!
    @IBOutlet var Koma13: UIImageView!
    @IBOutlet var Koma14: UIImageView!
    @IBOutlet var Koma15: UIImageView!
    
    var komasuu: Int = 0
    //komasuu=受け取ったやつ
    var amarinokazu: Int = 0
    
    var susumukazu: Int = 4
    
    var nangyou: Int = 0
    
    var section: Int = 0
    
        
//    var count2: Int!
//
//    var doko: Int!

    
    
    let saveData: UserDefaults = UserDefaults.standard
    //saveDataはkomasuu＝その時にやった分だけしか進めない 奴が入っている
    
    let goukei: UserDefaults = UserDefaults.standard
    //今までの合計方法
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        collection.delegate = self
//        collection.dataSource = self
//
        //count2 = saveData.object(forKey: "hunn") as? Int
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:100 , height: 100)
        layout.sectionInset = UIEdgeInsets(top: 25,left: 15,bottom: 25,right: 15)
        collection.collectionViewLayout = layout
        
        if let koma = saveData.object(forKey: "countkoma") {
            komasuu = koma as! Int
        }
        ///komasuuはTimerから値渡しされたもの。現段階ではやった分だけ(○分)だけ進むようになった！！
        ///if letこうぶん
        if let susumu = goukei.object(forKey: "goukei") {
            //userdefaultsのなかみがnilじゃなかったら
            susumukazu = susumu as! Int
        } else {
            
        }
        
        print("値渡しされた数は\(susumukazu)")
        susumukazu = komasuu + susumukazu //結果的に進む数
            print("結果的に進むのは\(susumukazu)")
        goukei.set(susumukazu, forKey: "goukei")
        section = susumukazu/3  ///27/3=9  15/3=5 30/3=10 31/3=10 33/3=11
        if section > 5 {
            nangyou = section / 5  ///9/5=1 10/5=2 11/5=2
            section = section - 5 * nangyou  ///9-5*1=4 0 10-5*2=0 11-5*2=1
//            collection.reloadData()
        }
        print("\(section)行表示") //5 0
        amarinokazu = susumukazu%3 ///5%3 2 4%3 1  30%3=0
        collection.reloadData()
        print("\(amarinokazu)あまりの数")
        collection.register(UINib(nibName: "CollectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
    }
        // Do any additional setup after loading the view
        
//    extension Koma1ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
//                func numberOfSections(in collectionView: UICollectionView) -> Int {
//                    return 5
//                }
//
//                func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
//                    return 3
//                }
//
//
//
//                func collectionView(_ collectionView: UICollectionView,
//                                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionCollectionViewCell
//
//                //cell.masu?.image = UIImage(named: "マス")
//
//                ///おそらくこれで自分のTableViewの中のCellを呼び出しているIBActionみたいな役割果たしていると思う
//
////        //        susumukazu = komasuu + susumukazu //結果的に進む数
////        //            print("結果的に進むのは\(susumukazu)")
////        //            goukei.set(susumukazu, forKey: "goukei")
////
////                //nangyou = susumukazu * 3
////                //amarinokazu = (susumukazu + komasuu) % 3 //あまり
////
//                    switch section {
//                    case 1:
//                        if indexPath.section == 0 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                    case 2:
//                        if indexPath.section == 1 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 0 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                    case 3:
//                        if indexPath.section == 1 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 0 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 2 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                    case 4:
//                        if indexPath.section == 1 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 0 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 2 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 3 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//
//                    case 0:
//                        if indexPath.section == 1 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 0 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 2 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 3 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 4 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//
//                    case 5:
//                        if amarinokazu == 0 {
//                        if indexPath.section == 0 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 1 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 2 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        if indexPath.section == 3 {
//                            cell.Koma.image = UIImage(named: "マス")
//                        }
//                        } else {
//
//                        }
//
//
//
//                            default:
//                                break
//                    }
//
//                    print("行の部分表示OK")
//
//                    switch susumukazu {//割り切れない時用/例外の時用
//                    case 1:
//                        if indexPath.section == 0 {
//                            if indexPath.row == 0 {
//                                cell.Koma.image = UIImage(named: "マス3")
//                            }
//                        }
//                    case 2:
//                        if indexPath.section == 0 {
//                            if indexPath.row == 1 {
//                                cell.Koma.image = UIImage(named: "マス3")
//                            }
//                            if indexPath.row == 0 {
//                                cell.Koma.image = UIImage(named: "マス")
//                            }
//                        }
//                    case 3:
//                        if indexPath.section == 0 {
//                            if indexPath.row == 2 {
//                                cell.Koma.image = UIImage(named: "マス3")
//                            }
//                            if indexPath.row == 0 {
//                                cell.Koma.image = UIImage(named: "マス")
//                            }
//                            if indexPath.row == 1 {
//                                cell.Koma.image = UIImage(named: "マス")
//                            }
//                        }
//
//                    default:
//                        break
//                    }
//
//
//                    switch amarinokazu {
//                    case 1:
//                        if self.section == 0 {
//                            if indexPath.section == 0 {
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                            }
//                        }
//                        if self.section == 1 {
//                            if indexPath.section == 1 {
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                            }
//                        }
//                        if self.section == 2 {
//                            if indexPath.section == 2 {
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                            }
//
//                        }
//                        if self.section == 3 {
//                            if indexPath.section == 3 {
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                            }
//                        }
//                        if self.section == 4 {
//                            if indexPath.section == 4 {
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                            }
//                        }
//                        if self.section == 5 {
//                            if indexPath.section == 0 {
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                            }
//                        }
//                    case 2:
//                        if self.section == 0 {
//                            if indexPath.section == 0 {
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                        if self.section == 1 {
//                            if indexPath.section == 1 {
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                        if self.section == 2 {
//                            if indexPath.section == 2 {
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//
//                        }
//                        if self.section == 3 {
//                            if indexPath.section == 3 {
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                        if self.section == 4 {
//                            if indexPath.section == 4 {
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                            if self.section == 5 {
//                                if indexPath.section == 0 {
//                                    if indexPath.row == 1 {
//                                        cell.Koma.image = UIImage(named: "マス3")
//                                    }
//                                    if indexPath.row == 0 {
//                                        cell.Koma.image = UIImage(named: "マス")
//                                    }
//                                }
//                            }
//                    case 0:
//                        if self.section == 1 {
//                            if indexPath.section == 0 {
//                                if indexPath.row == 2 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                        if self.section == 2 {
//                            if indexPath.section == 1 {
//                                if indexPath.row == 2 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                                print("correct")
//                            }
//                        }
//                        if self.section == 3 {
//                            if indexPath.section == 2 {
//                                if indexPath.row == 2 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                        if self.section == 4 {
//                            if indexPath.section == 3 {
//                                if indexPath.row == 2 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                        if self.section == 5 {
//                            if indexPath.section == 4 {
//                                if indexPath.row == 2 {
//                                    cell.Koma.image = UIImage(named: "マス3")
//                                }
//                                if indexPath.row == 0 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                                if indexPath.row == 1 {
//                                    cell.Koma.image = UIImage(named: "マス")
//                                }
//                            }
//                        }
//                    default:
//                        break
//                    }
//
//                    print("あまりの数表示OK")
//
//                return cell
//            }
//    }
    
   

    
   
//
//
//
//
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//}

//extension Koma1ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
//        return 3
//    }
}

extension Koma1ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 5
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return 3
        }
//
//
//
        func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionCollectionViewCell
//
//        //cell.masu?.image = UIImage(named: "マス")
//
//        ///おそらくこれで自分のTableViewの中のCellを呼び出しているIBActionみたいな役割果たしていると思う
//
////        susumukazu = komasuu + susumukazu //結果的に進む数
////            print("結果的に進むのは\(susumukazu)")
////            goukei.set(susumukazu, forKey: "goukei")
//
//        //nangyou = susumukazu * 3
//        //amarinokazu = (susumukazu + komasuu) % 3 //あまり
//
            switch section {
            case 1:
                if indexPath.section == 0 {
                    cell.Koma.image = UIImage(named: "マス")
                }
            case 2:
                if indexPath.section == 1 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 0 {
                    cell.Koma.image = UIImage(named: "マス")
                }
            case 3:
                if indexPath.section == 1 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 0 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 2 {
                    cell.Koma.image = UIImage(named: "マス")
                }
            case 4:
                if indexPath.section == 1 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 0 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 2 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 3 {
                    cell.Koma.image = UIImage(named: "マス")
                }

            case 0: //全てがピッタリとは限らない
                if amarinokazu == 0 {
                if indexPath.section == 1 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 0 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 2 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 3 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 4 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                }
                if amarinokazu == 1 {
                }
                if amarinokazu == 2 {
                    if indexPath.section == 0 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }

            case 5:
                if amarinokazu == 0 {
                if indexPath.section == 0 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 1 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 2 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                if indexPath.section == 3 {
                    cell.Koma.image = UIImage(named: "マス")
                }
                } else {

                }



                    default:
                        break
            }

            print("行の部分表示OK")

            switch susumukazu {//割り切れない時用/例外の時用
            case 1:
                if indexPath.section == 0 {
                    if indexPath.row == 0 {
                        cell.Koma.image = UIImage(named: "マス3")
                    }
                }
            case 2:
                if indexPath.section == 0 {
                    if indexPath.row == 1 {
                        cell.Koma.image = UIImage(named: "マス3")
                    }
                    if indexPath.row == 0 {
                        cell.Koma.image = UIImage(named: "マス")
                    }
                }
            case 3:
                if indexPath.section == 0 {
                    if indexPath.row == 2 {
                        cell.Koma.image = UIImage(named: "マス3")
                    }
                    if indexPath.row == 0 {
                        cell.Koma.image = UIImage(named: "マス")
                    }
                    if indexPath.row == 1 {
                        cell.Koma.image = UIImage(named: "マス")
                    }
                }

            default:
                break
            }


            switch amarinokazu {
            case 1:
                print("あまり1")
                if self.section == 0 {
                    if indexPath.section == 0 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                    }
                }
                if self.section == 1 {
                    if indexPath.section == 1 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                    }
                }
                if self.section == 2 {
                    if indexPath.section == 2 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                    }

                }
                if self.section == 3 {
                    if indexPath.section == 3 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                    }
                }
                if self.section == 4 {
                    if indexPath.section == 4 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                    }
                }
                if self.section == 5 {
                    if indexPath.section == 0 {
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                    }
                }
            case 2:
                print("あまりの2")
                if self.section == 0 {
                    if indexPath.section == 0 {
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 1 {
                    if indexPath.section == 1 {
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 2 {
                    if indexPath.section == 2 {
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }

                }
                if self.section == 3 {
                    if indexPath.section == 3 {
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 4 {
                    if indexPath.section == 4 {
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                    if self.section == 5 {
                        if indexPath.section == 0 {
                            if indexPath.row == 1 {
                                cell.Koma.image = UIImage(named: "マス3")
                            }
                            if indexPath.row == 0 {
                                cell.Koma.image = UIImage(named: "マス")
                            }
                        }
                    }
            case 0:
                print("あまりの数0")
                if self.section == 1 {
                    if indexPath.section == 0 {
                        if indexPath.row == 2 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 2 {
                    if indexPath.section == 1 {
                        if indexPath.row == 2 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        print("correct")
                    }
                }
                if self.section == 3 {
                    if indexPath.section == 2 {
                        if indexPath.row == 2 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 4 {
                    if indexPath.section == 3 {
                        if indexPath.row == 2 {
                            cell.Koma.image = UIImage(named: "マス3")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 5 {
                    if indexPath.section == 4 {
                        if indexPath.row == 2 {
                            cell.Koma.image = UIImage(named: "マス3")
                            print("correct")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
                if self.section == 0 {
                    if indexPath.section == 4 {
                        if indexPath.row == 2 {
                            cell.Koma.image = UIImage(named: "マス3")
                            print("correct")
                        }
                        if indexPath.row == 0 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                        if indexPath.row == 1 {
                            cell.Koma.image = UIImage(named: "マス")
                        }
                    }
                }
            default:
                break
            }


        return cell
    }


}
