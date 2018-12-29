//
//  HomeWorkerTests.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/29/18.
//  Copyright (c) 2018 Nagwa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import NagwaTask
import XCTest

class HomeWorkerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HomeWorker!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupHomeWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomeWorker()
  {
    sut = HomeWorker(repository: HomeWorkerAPI())
  }
  
  // MARK: Test doubles
  
  // MARK: Tests
  
  func testSomething()
  {
    // Given
    
    // When
    
    // Then
  }
}
