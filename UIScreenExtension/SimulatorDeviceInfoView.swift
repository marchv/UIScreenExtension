//
//  SimulatorDeviceInfoView.swift
//  UIScreenExtension
//
//  Created by Tristan Warner-Smith on 05/06/2021.
//  Copyright © 2021 marchv. All rights reserved.
//

import SwiftUI

struct SimulatorDeviceInfoView: View {

    @available(iOS 13.0, *)
    var body: some View {
        Text("Model identifier: ") + Text("\(UIDevice.modelIdentifier)").bold()
    }
}

struct SimulatorDeviceInfoView_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        SimulatorDeviceInfoView()
    }
}
