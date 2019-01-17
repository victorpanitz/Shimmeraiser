//
//  ShimmeraiserTests.swift
//  Shimmeraiser_ExampleTests
//
//  Created by Victor on 15/01/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Shimmeraiser

class ShimmerTests: QuickSpec {

    override func spec() {
        
            let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            let viewController = UIViewController(nibName: nil, bundle: nil)
            viewController.view.frame = frame
            
            let shimmerable = DummyShimmerable()
            let shimmerView = ShimmerView(containerView: viewController.view, shimmerable: shimmerable)
    
        describe("Shimmer") {
            
            beforeEach {
                Shimmer.show(shimmerable, in: viewController)
            }
            
            describe("quando `show` for acionado") {

                it("então deverá anexar a shimmerView.layer um sublayer") {
                    expect(shimmerView.layer.sublayers!.count == 1) == true
                }

                it("então o sublayer de shimmerView.layer deverá ter o mesmo frame da shimmerView") {
                    expect(shimmerView.layer.sublayers!.first!.frame) == shimmerView.frame
                }

                it("então o sublayer de shimmerView.layer deverá ter o backgroundColor igual ao parâmetro startColor") {
                    expect(shimmerView.layer.sublayers!.first!.backgroundColor) == #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1).cgColor
                }

                it("então deverá adicionar um gradientLayer ao sublayer da shimmerView.layer") {
                    expect(shimmerView.layer.sublayers!.first!.sublayers!.count == 1) == true
                    expect(shimmerView.layer.sublayers!.first!.sublayers!.first!).to(beAKindOf(CAGradientLayer.self))
                }

                it("então o gradientLayer adicionado ao sublayer da shimmerView.layer deverá ter frame da shimmerView com a largura multiplicada pelo parâmetro widthPercent") {
                    let frame = CGRect(x: 0, y: 0, width: 200, height: 200)

                    expect(shimmerView.layer.sublayers!.first!.sublayers!.first!.frame) == frame
                }

                it("então o gradientLayer adicionado ao sublayer da shimmerView.layer deverá ter uma animação chamada `shimmer`") {
                    expect(shimmerView.layer.sublayers!.first!.sublayers!.first!.animation(forKey: "shimmer")).toNot(beNil())
                }

                it("então o gradientLayer adicionado ao sublayer da shimmerView.layer deverá ter 14 escalas de cores") {
                    let gradientLayer = (shimmerView.layer.sublayers!.first!.sublayers!.first! as! CAGradientLayer)

                    expect(gradientLayer.colors!.count) == 14
                    expect((gradientLayer.colors![0] as! CGColor)) == #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1).withAlphaComponent(0.7).cgColor
                    expect((gradientLayer.colors![1] as! CGColor)) == #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1).withAlphaComponent(0.2).cgColor
                    expect((gradientLayer.colors![2] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.2).cgColor
                    expect((gradientLayer.colors![3] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.4).cgColor
                    expect((gradientLayer.colors![4] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.6).cgColor
                    expect((gradientLayer.colors![5] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.8).cgColor
                    expect((gradientLayer.colors![6] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(1.0).cgColor
                    expect((gradientLayer.colors![7] as! CGColor)) ==  #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(1.0).cgColor
                    expect((gradientLayer.colors![8] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.8).cgColor
                    expect((gradientLayer.colors![9] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.6).cgColor
                    expect((gradientLayer.colors![10] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.4).cgColor
                    expect((gradientLayer.colors![11] as! CGColor)) == #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1).withAlphaComponent(0.2).cgColor
                    expect((gradientLayer.colors![12] as! CGColor)) == #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1).withAlphaComponent(0.2).cgColor
                    expect((gradientLayer.colors![13] as! CGColor)) == #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1).withAlphaComponent(0.7).cgColor
                }
            }

            describe("quando `hide` for acionado") {
                
                it("então deverá remover todos sublayers da shimmerView") {
                    expect(shimmerView.layer.sublayers!.count == 1) == true

                    Shimmer.hide()

                    expect(shimmerView.superview).to(beNil())
                }

            }
        }
    }
}

