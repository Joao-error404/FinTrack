//
//  GoalsViewModel.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import Combine
import Foundation

@MainActor
class GoalsViewModel: ObservableObject {
    @Published var goals: [Goal] = []
}
