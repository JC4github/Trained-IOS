//
//  SideMenuViewModel.swift
//  Trained
//
//  Created by Boss Man on 22/11/23.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case settings
    case home
    case stats
    case history
    case journal
    
    var title: String {
        switch self {
        case .settings: return "Settings"
        case .home: return "Home"
        case .stats: return "Stats"
        case .history: return "History"
        case .journal: return "Journal"
        }
    }
    
    var imageName: String {
        switch self {
        case .settings: return "gear"
        case .home: return "house"
        case .stats: return "chart.pie.fill"
        case .history: return "clock.arrow.circlepath"
        case .journal: return "book.pages"
        }
    }
}
