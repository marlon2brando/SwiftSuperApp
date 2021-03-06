//
//  DemoDetailView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/08.
//

import SwiftUI

struct DemoDetailView: View {
    var demoModel: DemoModel
    
    @EnvironmentObject var appData: AppDataStore

    var body: some View {
        VStack{
            containedView()
        }
    }
    
    func containedView() -> AnyView {
        switch demoModel.name {
        case "LandMarks":
            return AnyView(HomeTabView())
        case "Drawing":
            return AnyView(Badge())
        case "SwiftUIGallery":
            return AnyView(SwiftUIViewGallery())
        case "ScrumdingerApp":
            return AnyView(ScrumpMain(models: $appData.scrumData.scrums ,saveAction: {
                appData.scrumData.save()
            }).onAppear(perform: {
                appData.scrumData.load()
            }))
        default:
            return AnyView(Text("Not found yet"))
        
        }
    }
}

struct DemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DemoDetailView(demoModel: DemoModel(name: "LandMarks", description: "Intro App"))
    }
}
