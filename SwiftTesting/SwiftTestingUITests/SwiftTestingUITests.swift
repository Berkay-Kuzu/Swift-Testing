//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by Berkay Kuzu on 27.09.2022.
//

import XCTest


// UI Test
final class SwiftTestingUITests: XCTestCase {

  
    func testToDoItem() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let addButton = app.navigationBars["To Dos"].buttons["Add"]
        
        
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField =  elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let okButton = elementsQuery.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do item").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do item")
        okButton.tap()
        
        XCTAssertTrue(addedCell.exists)
    }

        func testDeleteItem() throws {
            
        let app = XCUIApplication()
        app.launch()
            
            let addButton = app.navigationBars["To Dos"].buttons["Add"]
            
            
            let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
            let textField =  elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            
            let okButton = elementsQuery.buttons["OK"]
            
            let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do item").element
            
            
            // tables
            let tablesQuery = app.tables
            let deleteButton = tablesQuery.buttons["Delete"]
            
    
            addButton.tap()
            textField.tap()
            textField.typeText("my to do item")
            okButton.tap()
            
            addedCell.swipeLeft()
            deleteButton.tap()
            
            XCTAssertFalse(addedCell.exists)
            
            
        
    
            
           
                       
        

            
    }
   
}
