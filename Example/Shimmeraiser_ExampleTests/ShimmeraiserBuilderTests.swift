//
//  ShimmeraiserBuilderTests.swift
//  Shimmeraiser_ExampleTests
//
//  Created by Victor on 15/01/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Shimmeraiser

class ShimmeraiserBuilderTests: QuickSpec {
    
    override func spec() {
        
        describe("ShimmeraiserBuilder") {
            
            describe("quando `appendRectPath` for acionado") {
                
                context("e houver a inserção de apenas um frame") {
                    
                    let builder = ShimmerPathBuilder()
                    
                    builder.appendRectPath(
                        cornerRadius: 3,
                        from: CGRect(x: 40, y: 40, width: 100, height: 100)
                    )
                    
                    it("então deverá anexar ao layer passado o UIBezierPath correspondente aos parâmetros passados") {
                        expect(builder.path) == UIBezierPath(
                            roundedRect: CGRect(x: 40, y: 40, width: 100, height: 100),
                            cornerRadius: 3
                        )
                    }
                    
                }
                
                context("e houver a inserção de mais de um frame") {
                    
                    let builder = ShimmerPathBuilder()
                    
                    builder.appendRectPath(
                        cornerRadius: 3,
                        from: CGRect(x: 40, y: 40, width: 100, height: 100),
                        CGRect(x: 200, y: 15, width: 10, height: 40)
                    )
                    
                    it("então deverá anexar ao layer passado o UIBezierPath correspondente aos parâmetros passados") {
                        let resultPath = UIBezierPath(
                            roundedRect: CGRect(x: 40, y: 40, width: 100, height: 100),
                            cornerRadius: 3
                        )
                        
                        resultPath.append(UIBezierPath(
                            roundedRect: CGRect(x: 200, y: 15, width: 10, height: 40),
                            cornerRadius: 3
                        ))
                        
                        expect(builder.path) == resultPath
                    }
                    
                }
            }
            
            describe("quando `addOvalRect` for acionado") {
                
                context("e houver a inserção de apenas um frame") {
                    
                    let builder = ShimmerPathBuilder()
                    
                    builder.appendOvalPath(from: CGRect(x: 40, y: 40, width: 100, height: 100))
                    
                    it("então deverá anexar ao layer passado o UIBezierPath correspondente aos parâmetros passados") {
                        expect(builder.path) == UIBezierPath(ovalIn: CGRect(x: 40, y: 40, width: 100, height: 100))
                    }
                    
                }
                
                context("e houver a inserção de mais de um frame") {
                    
                    let builder = ShimmerPathBuilder()
                    
                    builder.appendOvalPath(
                        from: CGRect(x: 40, y: 40, width: 100, height: 100),
                        CGRect(x: 200, y: 15, width: 10, height: 40)
                    )
                    
                    it("então deverá anexar ao layer passado o UIBezierPath correspondente aos parâmetros passados") {
                        let resultPath = UIBezierPath(ovalIn: CGRect(x: 40, y: 40, width: 100, height: 100))
                        resultPath.append(UIBezierPath(ovalIn: CGRect(x: 200, y: 15, width: 10, height: 40)))
                        
                        expect(builder.path) == resultPath
                    }
                    
                }
            }
            
            describe("quando `mask` for acionado") {
                
                let builder = ShimmerPathBuilder()
                
                builder.appendRectPath(
                    cornerRadius: 3,
                    from: CGRect(x: 40, y: 40, width: 100, height: 100),
                    CGRect(x: 200, y: 15, width: 10, height: 40)
                )
                
                let mask = builder.makeMaskPath()
                
                let path = UIBezierPath(roundedRect: CGRect(x: 40, y: 40, width: 100, height: 100), cornerRadius: 3)
                path.append(UIBezierPath(roundedRect: CGRect(x: 200, y: 15, width: 10, height: 40), cornerRadius: 3))
                
                let layer = CAShapeLayer()
                layer.path = path.cgPath
                
                it("então deverá retornar um layer contendo o path passado") {
                    expect(mask) == layer.path
                }
            }
        }
    }
}
