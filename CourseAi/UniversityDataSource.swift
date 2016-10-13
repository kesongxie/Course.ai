//
//  UniversityDataSource.swift
//  course.io
//
//  Created by Xie kesong on 10/10/16.
//  Copyright © 2016 ___KesongXie___. All rights reserved.
//

import Foundation


let university1 = University(name: "University of California, San Diego", emailExtension: "@ucsd.edu")
let university2 = University(name: "University of California, Santa Cruz", emailExtension: "@ucsc.edu")
let university3 = University(name: "University of California, Irvine", emailExtension: "@irve.edu")
let university4 = University(name: "University of California, Bekerley", emailExtension: "@ucb.edu")


struct UniversityDataSource{
    static let university = [university1, university2, university3, university4]
}
