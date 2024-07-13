//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Gaurav Sharma on 12/07/24.
//

import SwiftUI

struct BarCodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()

    var body: some View {
       
        NavigationView{
            VStack{
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 300)
                
                Spacer().frame(height: 60)

                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusColor)
                    .padding()
            
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem){ alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarCodeScannerView()
}
