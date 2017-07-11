//
//  MKMapView+.swift
//  lafourchette-test
//
//  Created by Remi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import MapKit

extension MKMapView {
    func quickAddPointAndZoom(lat: Double, long: Double) {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        annotation.coordinate = centerCoordinate
        addAnnotation(annotation)
        let region = MKCoordinateRegion(center: centerCoordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        setRegion(region, animated: true)
    }
}
