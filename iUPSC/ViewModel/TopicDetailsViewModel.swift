//
//  TopicDetailsViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

class TopicDetailsViewModel: ObservableObject {
    
    let topic: Topic
    
    init(topic: Topic) {
        self.topic = topic
    }
}
