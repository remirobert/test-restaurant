//
//  CollectionDataSourceTests.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Quick
import Nimble
@testable import lafourchette_test

class CollectionDataSourceTests: QuickSpec {
    private var collectionView: UICollectionView!

    override func spec() {
        describe("CollectionDataSourceTests") {
            beforeEach {
                self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
            }
            it("the collectionViewDataSource should return the right number of items when no datas") {
                let collectionDataSource = CollectionViewDataSource<String>()
                expect(collectionDataSource.collectionView(self.collectionView, numberOfItemsInSection: 0)) == 0
            }
            it("the collectionViewDataSource should return the right number of items") {
                let collectionDataSource = CollectionViewDataSource<String>(datas: ["str1", "str2"])
                expect(collectionDataSource.collectionView(self.collectionView, numberOfItemsInSection: 0)) == 2
            }
            it("the collectionViewDataSource should provide the right datas to the cellFactory") {
                let collectionDataSource = CollectionViewDataSource<String>(datas: ["str1", "str2"])
                var excpectedCollectionView: UICollectionView!
                var expectedData: String!
                var expectedIndexPath: IndexPath!
                let expectedCell = UICollectionViewCell()

                collectionDataSource.cellFactory = { (collectionView: UICollectionView, data: String, indexPath: IndexPath) in
                    excpectedCollectionView = collectionView
                    expectedData = data
                    expectedIndexPath = indexPath
                    return expectedCell
                }
                let path = IndexPath(row: 1, section: 0)
                let cell = collectionDataSource.collectionView(self.collectionView, cellForItemAt: path)
                expect(expectedCell) === cell
                expect(excpectedCollectionView) === self.collectionView
                expect(expectedData) == "str2"
                expect(expectedIndexPath) == path
            }
        }
    }
}
