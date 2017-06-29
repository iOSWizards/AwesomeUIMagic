//
//  QuestContentTextView.swift
//  Quests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 11/04/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit

class QuestContentTextView: UITextView {

     override var canBecomeFirstResponder: Bool {
        return false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textContainerInset = .zero
        self.textContainer.lineFragmentPadding = 0
    }
    
    deinit {
        // force calling deinit
    }
    
}
